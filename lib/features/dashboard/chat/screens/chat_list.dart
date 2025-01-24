import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/custom_colors.dart';
import '../../../../common/user_preferences.dart';
import '../../../../tools/constants.dart';
import '../../../../tools/custom_dialogs.dart';
import '../../../../utils/datetime_format.dart';
import '../../home/presentation/widgets/background_home.dart';
import '../presentation/chat_controller.dart';
import '../../../init/presentation/loading/widgets/loader.dart';
import '../../../../tools/custom_text.dart';
import '../../../../tools/paths/paths_icons.dart';

import '../../../../common/network/socket_manager.dart';
import '../../profile/profile_controller.dart';
import '../presentation/widgets/user_list_modal.dart';

class ChatList extends ConsumerStatefulWidget {
  const ChatList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatListState();
}

class _ChatListState extends ConsumerState<ChatList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SocketManager().initSocket();
      ref.read(chatControllerProvider.notifier).getUserData();
      if (SocketManager().isConnected) {
        ref.read(chatControllerProvider.notifier).setIsConnected(true);
      }
      ref.read(chatControllerProvider.notifier).getChatMessages();
      ref.read(chatControllerProvider.notifier).getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(chatControllerProvider);
    var controller = ref.read(chatControllerProvider.notifier);
    var currentUser = ref.watch(profileController);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: prefs.isDarkMode
            ? darkColors.containerColor
            : darkColors.backgroundColor,
        elevation: 0,
        leading: Container(),
        title: CustomText(
          'Mensajes',
          fontWeight: FontWeight.bold,
          fontSize: 17.sp,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.wifi,
              color: state.isConnected ? Colors.green : Colors.red,
            ),
            onPressed: () {
              // log('==== Open list of chat ====');
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              icons.chat,
              height: 20.h,
              color: Colors.white,
            ),
            onPressed: () {
              dialogs.showModalBottomDynamic(
                context,
                child: UserListModal(
                  users: state.users,
                  onTap: (user) {
                    Future.delayed(
                      const Duration(milliseconds: 500),
                      () {
                        context.pop();
                      },
                    );
                    // controller.createConversation(user, context);
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: BackgroundHome(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            color: lightColors.white01,
            child: Column(
              children: [
                // Filtro y búsqueda
                Container(
                  color: darkColors.containerColor,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: lightColors.white01,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: lightColors.grey01,
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Buscar',
                                        hintStyle: TextStyle(
                                          color: lightColors.grey01,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          decoration: BoxDecoration(
                            color: lightColors.white01,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset(
                              icons.filter,
                              colorFilter: ColorFilter.mode(
                                lightColors.grey01,
                                BlendMode.srcIn,
                              ),
                              height: 20.h,
                            ),
                            onPressed: () {
                              // log('==== Open filter ====');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10.h),
                // Lista de chats o mensajes
                Expanded(
                  child: state.isLoading
                      ? const Loader(
                          textInformation: 'Cargando información...',
                        )
                      : ListView.builder(
                          itemCount: state.chatsResponse.length,
                          itemBuilder: (context, index) {
                            final conversation = state
                                .chatsResponse[index].conversations
                                ?.firstWhere(
                              (participant) =>
                                  participant.user?.id !=
                                  currentUser.userData?.user?.id,
                            );

                            final latestMessage =
                                state.chatsResponse[index].latestMessage;

                            final isGroup = state.chatsResponse[index].isGroup;
                            final id =
                                state.chatsResponse[index].conversationId;

                            return ListTile(
                              onTap: () {
                                if (conversation?.user != null) {
                                  controller.cleanMessages();
                                  context.pushNamed(
                                    'chatRoom',
                                    pathParameters: {
                                      // 'id': conversation!.user!.id.toString(),
                                      'id': id.toString(),
                                    },
                                    extra: conversation?.user,
                                  );
                                }
                                controller.setChatRoomId(id!);
                              },
                              style: ListTileStyle.drawer,
                              tileColor: lightColors.white01,
                              leading: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 38,
                                  backgroundColor: Colors.white,
                                  foregroundImage: NetworkImage(
                                    conversation?.user?.image ??
                                        constants.photoProfile,
                                  ),
                                ),
                              ),
                              title: CustomText(
                                isGroup == true
                                    ? '${conversation?.user?.jobPosition?.name}'
                                    : conversation?.user?.firstName,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                textColor: lightColors.black01,
                              ),
                              subtitle: latestMessage != null
                                  ? CustomText(
                                      latestMessage.content ?? '',
                                      fontSize: 12.sp,
                                      textColor: lightColors.grey01,
                                    )
                                  : null,
                              // Trailing, created message date
                              trailing: latestMessage != null
                                  ? CustomText(
                                      HelperDateTimeFormat.formatLatestMessage(
                                          latestMessage.createdAt ?? ''),
                                      fontSize: 12.sp,
                                      textColor: lightColors.grey01,
                                    )
                                  : null,
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
