import 'dart:convert';

import 'package:intl/date_symbol_data_local.dart';

import 'domain/models/pessoa_model.dart';
import 'funcoes_data.dart';

void main() async {
  await initializeDateFormatting('pt_BR');

  String jsonStr1 = '''
   {
     "id" : 1,
     "first_name" : "Claudney",
     "last_name" : "Sessa",
     "date_of_birth" : "1984-07-06 10:51:12"
   }
  ''';

  String jsonStr2 = '''
   {
     "first_name" : "Claudney",
     "date_of_birth" : "1984-07-06 00:00:00"
   }
  ''';

  String jsonStr3 = '''
   {
     "date_of_birth" : "1984-07-06 00:00:00"
   }
  ''';

  try {
    DateTime? data;

    // Data PtBr
    data = FuncoesData.convertStringPtBrToDateTime(
      '25/11/2024 15:52:23',
    );

    // ignore: avoid_print
    print(data);

    // ignore: avoid_print
    print(FuncoesData.convertDateTimeToStringPtBr(data));

    // ignore: avoid_print
    print(FuncoesData.escreverDataPorExtenso(data));
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }

  try {
    DateTime? data;

    // Data Sybase
    data = FuncoesData.convertStringPtBrToDateTime(
      '2024-07-06 15:52:23',
      formato: MascaraFormatoData.sybaseDataFormat,
      locale: "pt_BR",
    );

    // ignore: avoid_print
    print(data);

    // ignore: avoid_print
    print(FuncoesData.convertDateTimeToStringPtBr(data));

    // ignore: avoid_print
    print(FuncoesData.escreverDataPorExtenso(data));
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }

  try {
    DateTime? data;

    // Data Iso8601
    data = FuncoesData.convertStringPtBrToDateTime(
      '2024-07-06T15:52:23',
      formato: MascaraFormatoData.iso8601DataFormat,
      locale: "pt_BR",
    );

    // ignore: avoid_print
    print(data);

    // ignore: avoid_print
    print(FuncoesData.convertDateTimeToStringPtBr(data));

    // ignore: avoid_print
    print(FuncoesData.escreverDataPorExtenso(data));
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }

  try {
    PessoaModel pessoa = PessoaModel.fromJson(json.decode(jsonStr1));

    // ignore: avoid_print
    print(pessoa.toJson());
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }

  try {
    PessoaModel pessoa = PessoaModel.fromJson(json.decode(jsonStr2));

    // ignore: avoid_print
    print(pessoa.toJson());
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }

  try {
    PessoaModel pessoa = PessoaModel.fromJson(json.decode(jsonStr3));

    // ignore: avoid_print
    print(pessoa.toJson());
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}
