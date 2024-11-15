import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/secure_storage.dart';
import '../../../../tools/routes.dart';
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
    bool isLoggedIn = await secureStorage.isLoggedIn();

    if (!context.mounted) return;
    if (isLoggedIn) {
      context.go(Routes.dashboard);
    } else {
      context.go(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images.splash),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagen en el centro
                Image.asset(
                  images.logoWhite,
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
