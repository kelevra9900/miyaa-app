import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/network/socket_manager.dart';
import '../../../common/user_preferences.dart';
import '../../../tools/custom_dialogs.dart';
import '../../../tools/models/modal_dynamic_data.dart';
import '../../init/presentation/splash_screen/utils/init_utils.dart';
import '../data/alert_repository.dart';
import 'incident_state.dart';

class IncidentsController extends StateNotifier<IncidentState> {
  IncidentsController({
    required this.alertRepository,
  }) : super(IncidentState());
  final AlertRepository alertRepository;

  void setImage(String image) {
    state = state.copyWith(image: image, imageSelected: true);
  }

  void clearImage() {
    state = state.copyWith(image: null, imageSelected: false);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description);
  }

  void setLoading(bool loading) {
    state = state.copyWith(loading: loading);
  }

  // Image picker
  final ImagePicker _picker = ImagePicker();

  Future<void> getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setImage(image.path);
      log('Image path: ${image.path}');
    }
  }

  Future<void> getImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setImage(image.path);
      log('Image path: ${image.path}');
    }
  }

  Future<void> uploadImage(BuildContext context) async {
    setLoading(true);
    try {
      if (state.image != null) {
        final String imageUrl = await alertRepository.uploadImage(state.image!);
        log('Getting ======> Image URL: $imageUrl');
        setImage(imageUrl);
      }
    } catch (e) {
      log('Error uploading image: $e');
    } finally {
      setLoading(false);
    }
  }

  void sendIncidentToServer(BuildContext context) async {
    // If image is not selected, show a dialog to confirm
    if (!state.imageSelected! && state.description!.isNotEmpty) {
      dialogs.showMessageYesNoDialog(
        context,
        data: ModalDinamicData(
          title: '¿Estás seguro?',
          subtitle: 'No has seleccionado una imagen, ¿quieres continuar?',
          labelButton: 'Continuar',
          colorButton: const Color(0XFF00A7DC),
          onPressedYes: () {
            sendIncident(context);
            context.pop();
          },
        ),
      );
    } else {
      sendIncident(context);
    }
  }

  void sendIncident(BuildContext context) async {
    setLoading(true);

    // Obtén la ubicación actual del usuario
    await initUtils.getCurrentLocation(context);

    String? imageUrl;
    if (state.image != null && state.image!.isNotEmpty) {
      await uploadImage(context);
      imageUrl = state.image;
    }
    log('Image path ======================: $imageUrl');

    // // Envía la alerta al servidor a través del socket
    SocketManager().emit('new_alert', buildAlertData(imageUrl));
    clearImage();
    setDescription('');

    setLoading(false);

    // Muestra mensaje de éxito y regresa a la pantalla anterior
    Future.delayed(const Duration(seconds: 2), () {
      context.pop();
    });
  }

  Map<String, dynamic> buildAlertData(String? imageUrl) {
    return {
      'latitude': prefs.latitude,
      'longitude': prefs.longitude,
      'content': state.description,
      'image': imageUrl,
    };
  }
}

final incidentControllerProvider =
    StateNotifierProvider<IncidentsController, IncidentState>(
  (ref) => IncidentsController(
    alertRepository: ref.watch(alertRepository),
  ),
);
