import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/custom_colors.dart';
import '../../../common/network/socket_manager.dart';
import '../../../tools/custom_dialogs.dart';
import '../../../tools/custom_text.dart';
import '../../../tools/paths/paths_icons.dart';
import '../../../tools/paths/paths_images.dart';
import '../../../widgets/buttons/primary_button.dart';
import 'incident_controller.dart';

class IncidentPage extends ConsumerStatefulWidget {
  const IncidentPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IncidentScreenState();
}

class _IncidentScreenState extends ConsumerState<IncidentPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SocketManager().initSocket();
    });
  }

  @override
  Widget build(BuildContext context) {
    var incidentController = ref.read(incidentControllerProvider.notifier);
    var state = ref.watch(incidentControllerProvider);
    FocusNode focusNode = FocusNode();
    // Form key to manage form validation
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.2),
        title: const Text('Reporte de incidente'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 120,
                height: 120,
                child: Image.asset(
                  images.logo,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 350,
                child: CustomText(
                  'Por favor, describe el incidente... Si es posible, adjunta una imagen.',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  focusNode: focusNode,
                  controller: controller,
                  maxLines: 4,
                  readOnly: state.loading ?? false,
                  onChanged: (description) {
                    incidentController.setDescription(description);
                  },
                  validator: (description) {
                    if (description == null || description.isEmpty) {
                      dialogs.showSnackBar(
                        context: context,
                        message: 'Por favor, ingrese una descripción',
                        isError: true,
                      );
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Ingrese una breve descripción del incidente',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  height: 35,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: state.imageSelected ?? false
                      ? Row(
                          children: <Widget>[
                            SvgPicture.asset(
                              icons.roundCheck,
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomText(
                                'Imagen seleccionada',
                                textColor: lightColors.primaryColor,
                                fontSize: 15,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                incidentController.clearImage();
                              },
                            ),
                          ],
                        )
                      : const SizedBox(),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: PrimaryButton(
                  text: 'Agrega una imagen',
                  textColor:
                      state.loading! ? Colors.black : lightColors.primaryColor,
                  backgroundColor: Colors.white,
                  fontSizeText: 15,
                  width: double.infinity,
                  height: 50,
                  isLoading: state.loading,
                  onPressed: () {
                    dialogs.showImageSourceDialog(context, () {
                      incidentController.getImageFromCamera();
                    }, () {
                      incidentController.getImageFromGallery();
                    });
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: PrimaryButton(
                  text: 'Enviar reporte',
                  fontSizeText: 15,
                  width: double.infinity,
                  backgroundColor: lightColors.primaryColor,
                  height: 50,
                  isLoading: state.loading,
                  onPressed: () {
                    if (controller.text.isEmpty) {
                      log('Description is empty');
                      dialogs.showSnackBar(
                        context: context,
                        message: 'Por favor, ingrese una descripción',
                        isError: true,
                      );
                      return;
                    }

                    focusNode.unfocus();
                    incidentController.sendIncidentToServer(context);
                    // controller.clear();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
