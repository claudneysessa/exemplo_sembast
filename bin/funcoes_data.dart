import 'package:intl/intl.dart';

abstract class MascaraFormatoData {
  static String sybaseDataFormat = "yyyy-MM-dd HH:mm:ss";
  static String stringPtBrDataFormat = "dd/MM/yyyy HH:mm:ss";
  static String iso8601DataFormat = "yyyy-MM-ddTHH:mm:ss";
}

abstract class FuncoesData {
  static DateTime? convertDataJsonToEntity(
    dynamic value,
  ) {
    if (value is String) {
      return DateTime.parse(value);
    }
    return null;
  }

  static String? convertDataEntityson(
    DateTime? value,
  ) {
    if (value != null) {
      return value.toIso8601String();
    }
    return null;
  }

  static DateTime convertStringPtBrToDateTime(
    String value, {
    String formato = "dd/MM/yyyy HH:mm:ss",
    String locale = "pt_BR",
  }) {
    try {
      final formatter = DateFormat(formato, locale);
      return formatter.parse(value);
    } catch (e) {
      return DateTime.now(); // ou throw Exception("Data inválida");
    }
  }

  static String convertDateTimeToStringPtBr(
    DateTime value, {
    String formato = "dd/MM/yyyy HH:mm:ss",
    String locale = "pt_BR",
  }) {
    try {
      final formatter = DateFormat(
        formato,
        locale,
      );
      return formatter.format(value);
    } catch (e) {
      return ''; // Ou lance uma exceção, conforme sua necessidade
    }
  }

  static String escreverDataPorExtenso(
    DateTime value,
  ) {
    try {
      // Define o padrão personalizado usando símbolos de formato
      final formatter = DateFormat.yMMMMd(
        'pt_BR',
      ); // y para o ano, MMMM para o nome do mês, d para o dia

      // Aplica o formato à data
      String formattedDate = formatter.format(value);

      // Ajusta para usar a vírgula em vez de espaço após o dia
      formattedDate = formattedDate.replaceFirstMapped(
        RegExp(r'(\d+)\s+(.*)'),
        (match) {
          return '${match.group(1)}, ${match.group(2)}';
        },
      );

      return formattedDate;
    } catch (e) {
      return ''; // Ou lance uma exceção, conforme sua necessidade
    }
  }
}
