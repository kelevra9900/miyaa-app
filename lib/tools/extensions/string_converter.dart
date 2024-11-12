extension StringConverter on String {
  String toFormatDate() {
    try {
      dynamic x = this;
      x ??= 0;

      if (x.runtimeType == String) {
        x = DateTime.parse(x ?? '0');
      }

      // Si 'x' es DateTime, entonces formatea la fecha
      if (x is DateTime) {
        String day = x.day.toString().padLeft(2, '0');
        String month = x.month.toString().padLeft(2, '0');
        String year = x.year.toString();
        return "$day/$month/$year";
      }

      // Si no es DateTime, devuelve la cadena original
      return this;
    } catch (e) {
      return this;
    }
  }
}
