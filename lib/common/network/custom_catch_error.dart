import 'dart:developer';

import 'package:flutter/material.dart';

import '../../tools/custom_dialogs.dart';
import '../../tools/models/modal_dynamic_data.dart';
import 'models/http_service_reponse.dart';

class CustomCatchError {
  catchError({
    required Object e,
    required BuildContext context,
    Function? onPressed,
    bool? enableDrag,
    bool? isDismissible,
  }) {
    if (e.runtimeType == HttpServiceResponse) {
      var res = e as HttpServiceResponse;
      if (res.errorCode == 401) {
        dialogs.showMessageDialog(context,
            enableDrag: enableDrag,
            isDismissible: isDismissible,
            data: ModalDinamicData(
                title: "¡Lo sentimos!",
                subtitle: res.message,
                onPressed: onPressed));
      } else {
        dialogs.showMessageDialog(context,
            enableDrag: enableDrag,
            isDismissible: isDismissible,
            data: ModalDinamicData(
                title: "¡Lo sentimos!",
                subtitle: res.message,
                onPressed: onPressed));
      }
    } else {
      log(e.toString());
      dialogs.showMessageDialog(
        enableDrag: enableDrag,
        isDismissible: isDismissible,
        context,
        data: ModalDinamicData(
          title: "¡Lo sentimos!",
          subtitle:
              "En este momento nuestro servicio está experimentando una falla técnica. Por favor vuelve a intentarlo.",
          labelButton: "Volver a intentar",
          onPressed: onPressed,
        ),
      );
    }
  }
}

final CustomCatchError customError = CustomCatchError();
