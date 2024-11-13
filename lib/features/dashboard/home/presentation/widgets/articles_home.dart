import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miyaa/tools/extensions/dimens_extension.dart';

import '../../../../../common/custom_colors.dart';
import '../../../../../common/user_preferences.dart';
import '../../../../../tools/custom_text.dart';
import '../../../../../tools/paths/paths_icons.dart';
import '../../../../../tools/paths/paths_images.dart';
import '../../../../../tools/styles.dart';

class ArticlesContainer extends StatelessWidget {
  const ArticlesContainer({
    super.key,
    this.title,
    this.location,
    this.qualification,
    this.urlImage,
    this.hasAgreement = false,
  });

  final String? title;
  final String? location;
  final String? qualification;
  final String? urlImage;
  final bool? hasAgreement;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: prefs.isDarkMode ? darkColors.containerColor : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 14.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            child: Container(
                height: 80.sp,
                width: 80.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  urlImage ?? "",
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Image.asset(
                      images.noImageAvailable,
                      fit: BoxFit.cover,
                    );
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      images.noImageAvailable,
                      fit: BoxFit.cover,
                    );
                  },
                )),
          ),
          SizedBox(width: 16.sp),
          SizedBox(
            width: context.width(.5),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: context.width(.4),
                      child: CustomText(
                        title,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (hasAgreement!) ...[
                      SvgPicture.asset(
                        icons.logo,
                        colorFilter: const ColorFilter.mode(
                          Colors.red,
                          BlendMode.srcIn,
                        ),
                      ),
                    ]
                  ],
                ),
                Divider(
                  color: lightColors.dividerColor,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      icons.warning,
                      width: 18.sp,
                      height: 18.sp,
                      colorFilter: styles.colorFilterIcon(),
                    ),
                    SizedBox(width: 5.sp),
                    SizedBox(
                      width: context.width(.42),
                      child: CustomText(
                        location,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.sp),
              ],
            ),
          )
        ],
      ),
    );
  }
}
