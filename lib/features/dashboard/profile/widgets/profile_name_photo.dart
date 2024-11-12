import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miyaa/common/custom_colors.dart';
import 'package:miyaa/tools/custom_text.dart';
import 'package:miyaa/tools/paths/paths_images.dart';

class ProfileNamePhoto extends StatefulWidget {
  const ProfileNamePhoto({
    super.key,
    this.name,
    this.urlImage,
  });
  final String? name;
  final String? urlImage;

  @override
  State<ProfileNamePhoto> createState() => _ProfileNamePhotoState();
}

class _ProfileNamePhotoState extends State<ProfileNamePhoto> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          UserPhoto(
            urlImage: widget.urlImage,
          ),
          SizedBox(height: 20.sp),
          CustomText(
            widget.name,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 6.sp),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
              radius: 8.sp,
              backgroundColor: lightColors.primaryButtonColor,
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 13.sp,
              ),
            ),
            SizedBox(width: 4.sp),
          ]),
        ],
      ),
    );
  }
}

class UserPhoto extends StatelessWidget {
  const UserPhoto({
    super.key,
    required this.urlImage,
    this.radius,
  });

  final String? urlImage;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 50.sp,
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(4.sp),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              child: ClipOval(
                child: Image.network(
                  urlImage ?? "",
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return ClipOval(
                      child: Image.asset(
                        images.noImageAvailable,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      images.noImageAvailable,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              )),
        ),
      ),
    );
  }
}

class UserPhotoChange extends StatelessWidget {
  const UserPhotoChange({
    super.key,
    required this.urlImage,
    this.onTap,
  });

  final String? urlImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50.sp,
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(4.sp),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  child: ClipOval(
                    child: Image.network(
                      urlImage ?? "",
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return ClipOval(
                          child: Image.asset(
                            images.noImageAvailable,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          images.noImageAvailable,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  )),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(75, 70),
          child: InkWell(
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            onTap: onTap,
            child: CircleAvatar(
                radius: 14.sp,
                backgroundColor: lightColors.primaryButtonColor,
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20.sp,
                )),
          ),
        )
      ],
    );
  }
}
