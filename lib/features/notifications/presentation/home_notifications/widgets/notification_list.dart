import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../common/network/custom_catch_error.dart';
import '../../../../../tools/paths/paths_icons.dart';
import '../home_notifications_controller.dart';
import '../home_notifications_state.dart';
import '../../../../../tools/extensions/dimens_extension.dart';

import 'container_notification.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({
    super.key,
    required this.controller,
    required this.state,
  });

  final HomeNotificationsController controller;
  final HomeNotificationsState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: context.width(),
        child: ListView.separated(
          itemCount: state.notificationList!.length,
          itemBuilder: (context, index) {
            return Slidable(
              endActionPane: ActionPane(
                extentRatio: 0.2,
                motion: const ScrollMotion(),
                children: [
                  DeleteButton(
                    controller: controller,
                    state: state,
                    index: index,
                  ),
                ],
              ),
              child: ContainerNotification(
                controller: controller,
                state: state,
                index: index,
                seeInformation:
                    (state.notificationList?[index].notifications[0].read ??
                        false),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 17),
        ),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.controller,
    required this.state,
    required this.index,
  });

  final HomeNotificationsController controller;
  final HomeNotificationsState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => await deleteNotification(context),
      child: Container(
        height: 74,
        width: 54,
        margin: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const SizedBox(
              height: 24,
              width: 24,
            ),
            SvgPicture.asset(
              icons.delete,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> deleteNotification(BuildContext context) async {
    try {
      await controller.notificationsRepository.deleteNotification(
          state.notificationList![index].notifications[0].id.toString());
      state.notificationList?.removeAt(index);
    } catch (e) {
      if (!context.mounted) return;
      customError.catchError(e: e, context: context);
    }
  }
}
