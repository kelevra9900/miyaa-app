import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// import 'package:miyaa/common/secure_storage.dart';
import 'package:miyaa/tools/routes.dart';

import '../../../../tools/extensions/dimens_extension.dart';
import '../../../../tools/paths/paths_images.dart';
import 'utils/init_utils.dart';

class SplashScreenPage extends ConsumerStatefulWidget {
  const SplashScreenPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreenPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () => initData());
    super.initState();
  }

  void initData() async {
    await initUtils.getCurrentLocation(context);
    // bool isLoggedIn = await secureStorage.isLoggedIn();

    if (!context.mounted) return;

    // if (isLoggedIn) {
    //   context.go(Routes.login);
    // } else {
    //   context.go(Routes.login);
    // }

    context.go(Routes.login);
  }

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
