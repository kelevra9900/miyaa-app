import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miyaa/features/dashboard/dashboard/dashboard_controller.dart';
import 'package:miyaa/features/dashboard/home/presentation/home_controller.dart';
import 'package:miyaa/features/dashboard/home/presentation/home_state.dart';
import 'package:miyaa/features/dashboard/home/presentation/widgets/articles_home.dart';
import 'package:miyaa/features/dashboard/home/presentation/widgets/background_home.dart';
import 'package:miyaa/features/dashboard/home/presentation/widgets/header_home.dart';
import 'package:miyaa/features/dashboard/home/presentation/widgets/ripple_button.dart';
import 'package:miyaa/tools/extensions/dimens_extension.dart';

import '../widgets/hello_user.dart';
import '../widgets/security_tools.dart';
import '../widgets/soon_home.dart';

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
                HelloUser(
                  controller: controller,
                  state: state,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const RippleButton(
                      route: '/',
                    ),
                    SizedBox(height: 70.sp),
                    SecurityToolsWidget(
                      onReportIncident: () {
                        // Lógica para reportar un incidente
                      },
                      onSafeAreaLocations: () {
                        // Lógica para mostrar áreas seguras
                      },
                      onCheckOut: () {
                        // Lógica para realizar check-out
                      },
                    ),
                    SizedBox(height: 30.sp),
                    SoonHome(
                      controller: dashBoardController,
                    ),
                    SizedBox(
                      width: context.width(.9),
                      height: 380.sp,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.announcements?.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // dashboardController.setViewMenuButtons(false);
                              // controller.setIdScreenHome(1);
                              // controller.setSelectedTopCategory(
                              //     listCategories[index]);
                            },
                            child: ArticlesContainer(
                              title: state.announcements?[index].title ?? '',
                              location:
                                  state.announcements?[index].content ?? '',
                              hasAgreement: false,
                              qualification: 'Importante',
                              urlImage: state.announcements?[index].image,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 70.sp),
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
