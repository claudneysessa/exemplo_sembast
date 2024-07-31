T? ifNullParseValue<T>(dynamic value, {required T Function(String) parser}) {
  if (value == null) {
    return null;
  } else if (value is T) {
    return value;
  } else if (value is String) {
    return parser(value);
  } else {
    throw ArgumentError('Tipo de dado inválido: $value');
  }
}

// Função que receve variant e converte para int
int? variantToInt(dynamic value) {
  if (value == null) {
    return null;
  } else if (value is int) {
    return value;
  } else if (value is String) {
    return int.parse(value);
  } else {
    throw ArgumentError('Tipo de dado inválido: $value');
  }
}

// Função que receve variant e converte para double
double? variantToDouble(dynamic value) {
  if (value == null) {
    return null;
  } else if (value is double) {
    return value;
  } else if (value is String) {
    return double.parse(value);
  } else {
    throw ArgumentError('Tipo de dado inválido: $value');
  }
}

// Função que receve variant e converte para String
String? variantToString(dynamic value) {
  if (value == null) {
    return null;
  } else if (value is String) {
    return value;
  } else {
    return value.toString();
  }
}

// Função que recebe variant e converte para DateTime
DateTime? variantToDateTime(dynamic value) {
  if (value == null) {
    return null;
  } else if (value is DateTime) {
    return value;
  } else if (value is String) {
    return DateTime.parse(value);
  } else {
    throw ArgumentError('Tipo de dado inválido: $value');
  }
}

// Função que recebe variant e converte para bool
bool? variantToBool(dynamic value) {
  if (value == null) {
    return null;
  } else if (value is bool) {
    return value;
  } else if (value is int) {
    return value == 1;
  } else if (value is String) {
    return value == '1';
  } else {
    throw ArgumentError('Tipo de dado inválido: $value');
  }
}
