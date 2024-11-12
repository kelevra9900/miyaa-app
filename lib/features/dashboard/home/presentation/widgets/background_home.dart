import 'package:flutter/material.dart';

import '../../../../../tools/extensions/dimens_extension.dart';

class BackgroundHome extends StatelessWidget {
  const BackgroundHome({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height(),
      width: context.width(),
      child: child,
    );
  }
}
