import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_colors.dart';
import '../../tools/custom_text.dart';
import '../../tools/extensions/dimens_extension.dart';
import '../../tools/styles.dart';
import '../switch/custom_switch.dart';

class CustomTileSwitch extends StatefulWidget {
  const CustomTileSwitch({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.hasDivider = true,
    required this.onChange,
    this.initValue,
    this.resetInitValue = false,
  });

  final String title;
  final String leadingIcon;
  final bool hasDivider;
  final bool? initValue;
  final Function(bool) onChange;
  final bool? resetInitValue;

  @override
  State<CustomTileSwitch> createState() => _CustomTileSwitchState();
}

class _CustomTileSwitchState extends State<CustomTileSwitch> {
  bool value = false;
  @override
  void initState() {
    value = widget.initValue ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.resetInitValue! ? value = widget.initValue ?? false : null;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 23.sp),
          child: Row(
            children: [
              SvgPicture.asset(
                widget.leadingIcon,
                colorFilter: styles.colorFilterIcon(),
              ),
              SizedBox(width: 10.sp),
              Expanded(
                flex: 50,
                child: SizedBox(
                    width: context.width(.5),
                    child: CustomText(widget.title, fontSize: 16, maxLines: 3)),
              ),
              const Spacer(),
              CustomSwitch(
                value: value,
                onChanged: (x) {
                  setState(() {
                    widget.onChange(x);
                    value = x;
                  });
                },
              )
            ],
          ),
        ),
        if (widget.hasDivider)
          Divider(
            color: lightColors.dividerColor,
            endIndent: 18.sp,
            indent: 18.sp,
          )
      ],
    );
  }
}
