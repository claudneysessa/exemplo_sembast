import 'package:logger/logger.dart';

import 'package:path/path.dart' as path;
import 'package:sembast/sembast_io.dart';

import 'package:sembast/sembast.dart';
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
    Logger logger = Logger();

    final dbPath = path.join(
        path.dirname(path.current), 'exemplo_sembast', 'exemplo_sembast.sbt');

    logger.i('Caminho do banco de dados: $dbPath');

    final databaseFactory = databaseFactoryIo;
    final database = await databaseFactory.openDatabase(dbPath);

    final tickerDAO = TickerDAO(database);
    final tickerRepository = TickerRepository(tickerDAO);

    for (int i = 0; i < 100; i++) {
      await tickerRepository.insert(TickerEntity(
        stock: 'stock $i',
        name: 'name $i',
        logo: 'logo $i',
        sector: 'sector $i',
        type: 'type $i',
      ));
    }

    // await tickerRepository.insert(TickerEntity(
    //   stock: 'stock 1',
    //   name: 'name',
    //   logo: 'logo',
    //   sector: 'sector',
    //   type: 'type',
    // ));

    TickerEntity? info = await tickerRepository.getById(50);

    logger.i(
      {
        "message": "tickerRepository.getAll()",
        "data": info!.toMap(),
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
