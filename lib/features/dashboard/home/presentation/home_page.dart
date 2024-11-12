// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miyaa/common/network/custom_catch_error.dart';
import 'package:miyaa/common/user_preferences.dart';
import 'package:miyaa/features/dashboard/dashboard/dashboard_controller.dart';
import 'package:miyaa/features/dashboard/home/presentation/home_controller.dart';
import 'package:miyaa/features/dashboard/home/presentation/screens/home_screen.dart';
import 'package:miyaa/features/init/presentation/loading/widgets/loader.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<HomePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async => await initData());
    super.initState();
  }

  Future<void> initData() async {
    prefs.currentScreenDashboard = 0;

    if (ref.watch(homeController).refreshData!) {
      try {
        ref.watch(dashboardController.notifier).setInitLoading(true);
        await ref.watch(homeController.notifier).initData();
        ref.watch(homeController.notifier).setRefreshData(false);
        ref.watch(dashboardController.notifier).setInitLoading(false);
      } catch (e) {
        ref.watch(dashboardController.notifier).setInitLoading(false);
        ref.watch(homeController.notifier).setInitLoadiing(false);
        customError.catchError(
            e: e, context: context, onPressed: () => Navigator.pop(context));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(homeController.notifier);
    var dashBoardController = ref.watch(dashboardController.notifier);
    var state = ref.watch(homeController);
    return state.initLoading!
        ? const Loader(textInformation: 'Cargando información...')
        : HomeScreen(
            controller: controller,
            state: state,
            dashBoardController: dashBoardController,
          );
  }
}
