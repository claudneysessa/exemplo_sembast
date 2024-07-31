import 'package:logger/logger.dart';
import 'package:exemplo_sembast/domain/repositories/aluno_repository.dart';
import 'package:exemplo_sembast/entities/aluno_entity.dart';

Future<void> exemploAluno(
  Logger logger,
  AlunoRepository alunoRepository,
) async {
  await alunoRepository.insert(AlunoEntity(
    nome: 'CLAUDNEY',
    data: null,
  ));

  await alunoRepository.insert(AlunoEntity(
    nome: 'JULIANA',
    data: null,
  ));

  await alunoRepository.insert(AlunoEntity(
    nome: 'ISADORA',
    data: null,
  ));

  await alunoRepository.insert(AlunoEntity(
    nome: 'Sidney',
    data: null,
  ));

  await alunoRepository.insert(AlunoEntity(
    nome: 'ValdNey',
    data: null,
  ));

  await alunoRepository.insert(AlunoEntity(
    nome: 'SIONESIA',
    data: null,
  ));

  await alunoRepository.insert(AlunoEntity());

  final alunosGetAll0 = await alunoRepository.getByNome('ney');
  logger
      .i('getByNome: ${alunosGetAll0.map((aluno) => aluno.toMap()).toList()}');

  final alunosGetAll1 = await alunoRepository.getAll();
  logger.i('getAll: ${alunosGetAll1.map((aluno) => aluno.toMap()).toList()}');

  int alunoId = 1;

  AlunoEntity? alunoGet = await alunoRepository.getById(alunoId);
  logger.i('getById: ${alunoGet?.toMap()}');

  try {
    if (alunoGet != null) {
      await alunoRepository.delete(alunoGet);
    }
  } catch (e) {
    logger.e('error: Erro ao deletar usuário: $e');
  }

  final alunosGetAll2 = await alunoRepository.getAll();
  logger.i('getAll: ${alunosGetAll2.map((aluno) => aluno.toMap()).toList()}');
}
