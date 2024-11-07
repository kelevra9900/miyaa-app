import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../tools/extensions/dimens_extension.dart';
import '../../../../tools/paths/paths_images.dart';

class SplashScreenPage extends ConsumerStatefulWidget {
  const SplashScreenPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height(),
        width: context.width(),
        child: Image.asset(
          images.splash,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
