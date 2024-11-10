final RegExp _emailRegExp = RegExp(
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
);
String? validateEmail(String email, {String? matchValue}) {
  if (email.isEmpty) {
    return 'Introduzca un correo electrónico';
  } else if (!_emailRegExp.hasMatch(email.trim())) {
    return 'Por favor, introduzca un correo electrónico válido';
  }

  /// Si es un campo de repetición
  if (matchValue != null) {
    return validateMatchValue(email, matchValue);
  }

  return null;
}

String? validatePassword(String input, {String? matchValue}) {
  if (input.isEmpty) {
    return 'Campo obligatorio';
  }
  if (input.trim().length < 8) {
    return 'Debe tener al menos 8 caracteres';
  }

  if (matchValue != null) {
    return validateMatchValue(input, matchValue);
  }
  return null;
}

String? validateChangePassword(String input, {String? matchValue}) {
  if (input.isEmpty) {
    return 'Campo obligatorio';
  }

  // Validar longitud mínima de 8 caracteres
  if (input.length < 8) {
    return 'La contraseña debe tener al menos 8 caracteres';
  }
  // Validar al menos 1 número
  if (!input.contains(RegExp(r'\d'))) {
    return 'La contraseña debe contener al menos un número';
  }
  // Validar al menos 1 letra mayúscula
  if (!input.contains(RegExp(r'[A-Z]'))) {
    return 'La contraseña debe contener al menos una letra mayúscula';
  }
  // Validar al menos 1 letra minúscula
  if (!input.contains(RegExp(r'[a-z]'))) {
    return 'La contraseña debe contener al menos una letra minúscula';
  }
  // Validar al menos 1 carácter especial
  if (!input.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return 'La contraseña debe contener al menos un carácter especial';
  }

  if (matchValue != null) {
    return validateMatchValue(input, matchValue);
  }
  return null;
}

String? validatePhone(String input, {String? matchValue}) {
  if (input.isEmpty || input.length != 14) {
    return 'Introduzca un número de teléfono móvil válido';
  }

  /// Si es un campo de repetición
  if (matchValue != null) {
    return validateMatchValue(input, matchValue);
  }
  return null;
}

String? validateDocument(input) {
  if (input.trim() == "") {
    return 'Introduzca su número de identificación';
  }
  if (input.trim().length != 13) {
    return 'You must fill out a valid document';
  }
  return null;
}

String? validateExpiryDate(String input) {
  if (input.isEmpty) {
    return 'El campo es obligatorio';
  } else {
// Verificar el formato MM/YY
    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(input)) {
      return 'Formato inválido (MM/YY)';
    }

    try {
      // Separar mes y año
      List<String> parts = input.split('/');
      int month = int.parse(parts[0]);
      int year = int.parse(parts[1]);

      // Validar mes
      if (month < 1 || month > 12) {
        return 'Mes inválido';
      }

      // Obtener el año actual
      int currentYear = DateTime.now().year % 100;
      int maxYear = currentYear + 10;

      // Validar año
      if (year < currentYear || year > maxYear) {
        return 'Año inválido';
      }
      return null;
    } catch (e) {
      return 'Fecha inválida';
    }
  }
}

String? validateName(String input) {
  if (input.isEmpty) {
    return 'El campo es obligatorio';
  } else {
    if (!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+( [a-zA-ZáéíóúÁÉÍÓÚñÑ]+)?$')
        .hasMatch(input)) {
      return 'Nombre inválido';
    }
    return null;
  }
}

String? validateSecondSurname(String input) {
  if (input.isEmpty) {
    return null;
  } else {
    if (!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+( [a-zA-ZáéíóúÁÉÍÓÚñÑ]+)?$')
        .hasMatch(input)) {
      return 'Apellido inválido';
    }
    return null;
  }
}

String? validateText(String input, {String? matchValue}) {
  if (input.isEmpty) {
    return 'El campo es obligatorio';
  } else {
    /// Si es un campo de repetición
    if (matchValue != null) {
      return validateMatchValue(input, matchValue);
    }
    return null;
  }
}

String? validateMatchValue(String value, String match) =>
    value != match ? 'No coinciden' : null;

String? noValidate() => null;
