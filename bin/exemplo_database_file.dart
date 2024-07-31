import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;
import 'package:sembast/sembast_io.dart';

import 'package:exemplo_sembast/domain/repositories/modalidade_repository.dart';
import 'package:exemplo_sembast/domain/repositories/aluno_repository.dart';
import 'package:exemplo_sembast/infrastructure/data_access/dao/modalidade_dao.dart';
import 'package:exemplo_sembast/infrastructure/data_access/dao/aluno_dao.dart';

import 'exemplos_isolados/exemplo_aluno.dart';
import 'exemplos_isolados/exemplo_modalidade.dart';

void main() async {
  Logger logger = Logger();

  final dbPath = path.join(path.dirname(path.current), 'exemplo_sembast.sql3');

  logger.i('Caminho do banco de dados: $dbPath');

  // Cria a fábrica de banco de dados em arquivo
  final databaseFactory = databaseFactoryIo;
  final database = await databaseFactory.openDatabase(dbPath);

  final alunoDAO = AlunoDAO(database);
  final alunoRepository = AlunoRepository(alunoDAO);
  await exemploAluno(logger, alunoRepository);

  final modalidadeDAO = ModalidadeDAO(database);
  final modalidadeRepository = ModalidadeRepository(modalidadeDAO);
  await exemploModalidade(logger, modalidadeRepository);

  await database.close();
}
