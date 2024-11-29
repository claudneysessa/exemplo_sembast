import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';
import 'package:spalla_core_framework/spalla_api_request/spalla_api_request.dart';

Future<void> init() async {
  await initializeDateFormatting('pt_BR');
}

void main() async {
  await init();

  var logger = Logger(
    printer: PrettyPrinter(
      noBoxingByDefault: false,
      printEmojis: false,
      dateTimeFormat: DateTimeFormat.dateAndTime,
      stackTraceBeginIndex: 0,
    ),
  );

  SpallaApiDioService spallaDioService = SpallaApiDioService();

  var requestRepository = SpallaApiRequestRepository(
    spallaDioService,
    baseUrl: 'https://192.168.0.12:55008',
    //userName: 'CLAUDNEY',
    //userPassword: 'DBM',
    userToken: 'aab3238922bcc25a6f606eb525ffdc56',
    //apiToken: 'SPA#1991000000001',
    debugMode: true,
  );

  var result =
      await requestRepository.functionRequest(requestBody: <String, dynamic>{
    "id": "",
    "version": "1.0.0",
    "method": "GET",
    "objectType": "TABLE",
    "objectName": "GRUPO",
    "where": [
      {
        "type": "Field",
        "name": "GP_COD",
        "value": 1,
      }
    ],
    "limit": 0,
    "offset": 0,
    "orderBy": ['GP_COD'],
  });

  logger.i(result.runtimeType);
  logger.i(result);
}
