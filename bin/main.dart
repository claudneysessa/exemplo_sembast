import 'infrastructure/services/sembast_service.dart';
import 'package:logger/logger.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';
import 'domain/entities/ticker_entity.dart';
import 'domain/repositories/ticker_repository.dart';
import 'infrastructure/data_access/dao/ticker_dao.dart';

void main() async {
  Logger logger = Logger(
    printer: PrettyPrinter(
      stackTraceBeginIndex: 0,
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 2,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
      noBoxingByDefault: false,
    ),
    level: Level.debug,
  );

  try {
    SembastService service;

    service = SembastService(
      databaseFactory: databaseFactoryMemory,
      useCodec: false,
    );

    Database database = await service.database;

    final tickerDAO = TickerDAO(database);
    final tickerRepository = TickerRepository(tickerDAO);

    await tickerRepository.insert(TickerEntity(
      id: 1,
      stock: 'stock',
      name: 'name',
      logo: 'logo',
      sector: 'sector',
      type: 'type',
    ));

    List<TickerEntity> info = await tickerRepository.getByField('id', 1);

    logger.i(
      {
        "message": "tickerRepository.getAll()",
        "data": info.map((e) => e.toMap()).toList(),
      },
    );

    await database.close();
  } on DatabaseException catch (e) {
    logger.e(
      e,
      time: DateTime.now(),
      error: 'Erro ao acessar o banco de dados',
      stackTrace: StackTrace.current,
    );
  } catch (e) {
    logger.e(
      e,
      time: DateTime.now(),
      stackTrace: StackTrace.current,
    );
  }
}
