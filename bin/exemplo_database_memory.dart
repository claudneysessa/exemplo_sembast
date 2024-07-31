import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;
import 'package:sembast/sembast_memory.dart';

import 'package:exemplo_sembast/domain/repositories/class_repository.dart';
import 'package:exemplo_sembast/domain/repositories/user_repository.dart';
import 'package:exemplo_sembast/infrastructure/data_access/dao/class_dao.dart';
import 'package:exemplo_sembast/infrastructure/data_access/dao/user_dao.dart';

import 'exemplos_isolados/exemplo_user.dart';
import 'exemplos_isolados/exemplo_class.dart';

void main() async {
  Logger logger = Logger();

  final dbPath = path.join(path.dirname(path.current), 'exemplo_sembast.sql3');

  logger.i('Caminho do banco de dados: $dbPath');

  // Cria a fábrica de banco de dados em memória
  final databaseFactory = databaseFactoryMemory;
  final database = await databaseFactory.openDatabase('exemplo_sembast_memory');

  final userDAO = UserDAO(database);
  final userRepository = UserRepository(userDAO);
  await exemploUser(logger, userRepository);

  final classDAO = ClassDAO(database);
  final classRepository = ClassRepository(classDAO);
  await exemploClass(logger, classRepository);

  await database.close();
}
