# Funções Utilitárias para Conversão de Tipos

Este documento descreve um conjunto de funções utilitárias para conversão de tipos de dados, tratando valores null e lançando exceções em caso de erros.

## Função ifNullParseValue

```dart

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

```

Objetivo:

- Converter um valor dinâmico value para um tipo específico T.

Parâmetros:

- value: O valor dinâmico a ser convertido.
- parser: Uma função que recebe uma string e converte para o tipo T.

Retorno:

- O valor convertido para o tipo T, ou null se o valor original for null.

Exemplo de uso:

```dart

final dateTime = ifNullParseValue<DateTime>('2023-10-26T17:40:14.220400Z', parser: DateTime.parse);

```

## Funções de Conversão de Tipos Específicos

### 1. variantToInt

```dart

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

```

Objetivo:

- Converter um valor dinâmico para int.

### 2. variantToDouble

```dart

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

```

Objetivo:

- Converter um valor dinâmico para double.

### 3. variantToString

```dart

String? variantToString(dynamic value) {
  if (value == null) {
    return null;
  } else if (value is String) {
    return value;
  } else {
    return value.toString();
  }
}

```

Objetivo:

- Converter um valor dinâmico para String.

### 4. variantToDateTime

```dart

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

```

Objetivo:

- Converter um valor dinâmico para DateTime.

### 5. variantToBool

```dart

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

```

Objetivo: Converter um valor dinâmico para bool.

## Observações:

- Essas funções são úteis para lidar com valores de diferentes tipos, especialmente ao recuperar dados de fontes externas ou do banco de dados.<br>
- O tratamento de valores null garante que o código seja mais robusto e evite erros.<br>
- Essas funções podem ser personalizadas para lidar com outros tipos de dados e cenários específicos.<br>
- As funções que convertem para int, double, DateTime e bool usam as funções de conversão nativas do Dart.<br>
