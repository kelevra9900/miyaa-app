import 'package:flutter/services.dart';

class CustomInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;
  CustomInputFormatter({
    required this.mask,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text;
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          text =
              '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}';
          if (text.substring(text.length - 1, text.length) == "-") {
            text = text.substring(0, text.length - 1);
          }
          return TextEditingValue(
            text: text,
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    if (newValue.text.isNotEmpty) {
      if (mask[newValue.text.length - 1] == separator) {
        return TextEditingValue(
          text: newValue.text.substring(0, newValue.text.length - 1),
          selection: TextSelection.collapsed(
            offset: newValue.selection.end - 1,
          ),
        );
      }
    }

    return newValue;
  }
}

class SingleSpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Permite solo un espacio en blanco
    final newText = newValue.text;
    if (newText.contains(RegExp(r' {2,}'))) {
      return oldValue;
    }
    return newValue;
  }
}

class PhoneFormatter extends TextInputFormatter {
  final String countryIndicator;

  PhoneFormatter(this.countryIndicator);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String formattedText = newValue.text;

    // Filtrar caracteres no permitidos
    formattedText = formattedText.replaceAll(RegExp(r'[^\d\s+]'), '');

    // Verifica si el nuevo valor ya contiene el indicativo del país
    if (!formattedText.startsWith('$countryIndicator ')) {
      // Agrega el indicativo del país al inicio del número de teléfono
      formattedText = '$countryIndicator $formattedText';
    }

    // Maneja la eliminación del indicativo del país al borrar
    if (oldValue.text.startsWith('$countryIndicator ') &&
        !formattedText.startsWith('$countryIndicator ')) {
      // Usuario borró el indicativo, entonces eliminamos el indicativo del país
      formattedText = formattedText.substring(countryIndicator.length + 1);
    }

    if (formattedText == "$countryIndicator $countryIndicator") {
      formattedText = "";
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class TimeAgoFormatter {
  String format(DateTime date) {
    final Duration diff = DateTime.now().difference(date);

    if (diff.inDays >= 365) {
      final int years = diff.inDays ~/ 365;
      return years == 1 ? 'Hace un año' : 'Hace $years años';
    } else if (diff.inDays >= 30) {
      final int months = diff.inDays ~/ 30;
      return months == 1 ? 'Hace un mes' : 'Hace $months meses';
    } else if (diff.inDays >= 1) {
      return diff.inDays == 1 ? 'Hace un día' : 'Hace ${diff.inDays} días';
    } else if (diff.inHours >= 1) {
      return diff.inHours == 1 ? 'Hace una hora' : 'Hace ${diff.inHours} horas';
    } else if (diff.inMinutes >= 1) {
      return diff.inMinutes == 1
          ? 'Hace un minuto'
          : 'Hace ${diff.inMinutes} minutos';
    } else if (diff.inSeconds >= 1) {
      return diff.inSeconds == 1
          ? 'Hace un segundo'
          : 'Hace ${diff.inSeconds} segundos';
    } else {
      return 'Hace un momento';
    }
  }
}
