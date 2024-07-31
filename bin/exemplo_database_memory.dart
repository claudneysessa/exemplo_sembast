import 'package:logger/logger.dart';
import 'package:sembast/sembast_memory.dart';

import 'package:exemplo_sembast/domain/repositories/modalidade_repository.dart';
import 'package:exemplo_sembast/domain/repositories/aluno_repository.dart';
import 'package:exemplo_sembast/infrastructure/data_access/dao/modalidade_dao.dart';
import 'package:exemplo_sembast/infrastructure/data_access/dao/aluno_dao.dart';

import 'exemplos_isolados/exemplo_aluno.dart';
import 'exemplos_isolados/exemplo_modalidade.dart';

void main() async {
  Logger logger = Logger();

  // Cria a fábrica de banco de dados em memória
  final databaseFactory = databaseFactoryMemory;
  final database = await databaseFactory.openDatabase('exemplo_sembast_memory');

  final alunoDAO = AlunoDAO(database);
  final alunoRepository = AlunoRepository(alunoDAO);
  await exemploAluno(logger, alunoRepository);

  final modaldiadeDAO = ModalidadeDAO(database);
  final modalidadeRepository = ModalidadeRepository(modaldiadeDAO);
  await exemploModalidade(logger, modalidadeRepository);

  await database.close();
}
