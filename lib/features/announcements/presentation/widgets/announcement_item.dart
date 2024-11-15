import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miyaa/features/announcements/domain/announcement.dart';

import '../../../../tools/custom_text.dart';
import '../../../../widgets/custom_cache_image.dart';

class AnnouncementItem extends StatelessWidget {
  const AnnouncementItem({super.key, required this.announcement});

  final Announcement announcement;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey[200]!,
                blurRadius: 10,
                offset: const Offset(0, 3))
          ],
        ),
        child: Wrap(
          children: [
            Hero(
              tag: 'blog${announcement.createdAt}',
              child: SizedBox(
                height: 160,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CustomCacheImage(
                    imageUrl: announcement.image,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    announcement.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    announcement.content.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    fontSize: 14,
                    textColor: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        CupertinoIcons.time,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        announcement.createdAt.toString(),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.favorite,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () => {
        context.pushNamed(
          'announcementDetails',
          extra: announcement,
          pathParameters: {'tag': 'blog${announcement.createdAt}'},
        ),
      },
    );
  }
}
