import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dashboard_controller.dart';
import 'widgets/custom_principal_menu.dart';
import '../home/presentation/home_page.dart';
import '../profile/profile_page.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(dashboardController.notifier);
    var state = ref.watch(dashboardController);
    return Scaffold(
        floatingActionButtonLocation: state.initLoading!
            ? null
            : FloatingActionButtonLocation.centerFloat,
        floatingActionButton: state.initLoading!
            ? null
            : state.viewMenuButtons!
                ? CustomPrincipalMenu(controller: controller, state: state)
                : null,
        body: SafeArea(child: getScreen(state.currentScreen!)));
  }

  /// Dado un ID de pantalla [idScreen], retorna el Widget correspondiente:
  /// - 0: Retorna la página de inicio [HomePage()].
  /// - 1: Retorna la página del calendario [CalendarPage()].
  /// - 2: Retorna la página de lista de notas [ListNotesPage()].
  /// - 3: Retorna la página de perfil [ProfilePage()].
  /// - 4: Retorna la página de servicios médicos [MedicalServicesPage()].
  Widget getScreen(int idScreen) {
    switch (idScreen) {
      case 0:
        return const HomePage();
      case 1:
        return const ProfilePage();
      case 2:
        return const ProfilePage();
      case 3:
        return const ProfilePage();
      case 4:
        return const ProfilePage();

      default:
        return Container();
    }
  }
}
