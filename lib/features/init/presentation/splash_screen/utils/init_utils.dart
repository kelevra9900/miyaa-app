// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:miyaa/common/secure_storage.dart';
import 'package:miyaa/tools/custom_dialogs.dart';
import 'package:miyaa/tools/models/modal_dynamic_data.dart';
import 'package:miyaa/tools/routes.dart';
import '../../../../../common/user_preferences.dart';

class InitUtils {
  goToNextPage({required BuildContext context}) {
    Timer(const Duration(seconds: 1), () async {
      bool isLoggedIn = await secureStorage.isLoggedIn();

      if (!context.mounted) return;
      if (prefs.isFirtsRun) {
        context.go(Routes.splash);
      } else {
        if (isLoggedIn) {
          context.go(Routes.login);
        } else {
          // context.go(Routes.home);
        }
      }
    });
  }

  /// Dado el contexto de la aplicación [context]
  /// Determina la posición actual del dispositivo del usuario y gestiona los permisos de ubicación si es necesario.
  /// Retorna una instacia de [Position] con la información de la localizacion actual
  Future<Position> determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        dialogs.showMessageYesNoDialog(
          context,
          data: ModalDinamicData(
            title: 'Atención',
            labelButtonNo: 'Cancelar',
            labelButtonYes: 'Aceptar',
            subtitle: 'Para continuar necesitamos acceder a tu ubicación.',
            onPressedYes: () async {
              Navigator.pop(context);
              await determinePosition(context);
              context.go(Routes.loading, extra: {"nextRoute": Routes.splash});
            },
          ),
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      dialogs.showMessageDialog(
        context,
        data: ModalDinamicData(
          title: 'Atención',
          subtitle:
              'Si no aceptas los permisos de ubicación no podrás acceder a toda la información disponible en nuestra app.',
        ),
      );
    }

    return await Geolocator.getCurrentPosition();
  }

  /// Dado el contexto de la aplicacion [context]
  /// Obtiene la ubicación geográfica actual del dispositivo del usuario y la guarda en las preferencias del usuario.
  /// No retorna nada
  Future<void> getCurrentLocation(BuildContext context) async {
    Position position = await determinePosition(context);
    prefs.latitude = position.latitude.toString();
    prefs.longitude = position.longitude.toString();
    log("latitude: ${prefs.latitude}");
    log("longitude: ${prefs.longitude}");
  }
}

InitUtils initUtils = InitUtils();
