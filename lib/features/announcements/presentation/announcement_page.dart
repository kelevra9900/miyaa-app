import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../tools/custom_text.dart';
import '../../dashboard/home/presentation/widgets/articles_home.dart';
import 'announcements_controller.dart';

class AnnouncementPage extends ConsumerStatefulWidget {
  const AnnouncementPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnnouncementPageState();
}

class _AnnouncementPageState extends ConsumerState<AnnouncementPage> {
  @override
  void initState() {
    Future.delayed(
        Duration.zero,
        () async => await ref
            .watch(announcementsControllerProvider.notifier)
            .initData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.read(announcementsControllerProvider.notifier);
    var state = ref.read(announcementsControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          'Anuncios',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getAnnouncements();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: state.announcements.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.only(top: 16.0),
                  itemCount: state.announcements.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ArticlesContainer(
                          title: state.announcements[index].title ?? '',
                          location: state.announcements[index].content ?? '',
                          hasAgreement: false,
                          qualification: 'Importante',
                          urlImage: state.announcements[index].image,
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: CustomText(
                      'No hay anuncios disponibles',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
