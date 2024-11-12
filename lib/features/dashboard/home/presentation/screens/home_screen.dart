import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miyaa/features/dashboard/dashboard/dashboard_controller.dart';
import 'package:miyaa/features/dashboard/home/presentation/home_controller.dart';
import 'package:miyaa/features/dashboard/home/presentation/home_state.dart';
import 'package:miyaa/features/dashboard/home/presentation/widgets/background_home.dart';
import 'package:miyaa/features/dashboard/home/presentation/widgets/header_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.controller,
    required this.state,
    required this.dashBoardController,
  });

  final HomeController controller;
  final HomeState state;
  final DashboardController dashBoardController;

  @override
  Widget build(BuildContext context) {
    return BackgroundHome(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                HeaderHome(
                  controller: controller,
                  state: state,
                ),
                SizedBox(height: 23.sp),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
