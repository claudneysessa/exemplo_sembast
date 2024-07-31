import 'package:logger/logger.dart';
import 'package:exemplo_sembast/domain/repositories/class_repository.dart';
import 'package:exemplo_sembast/entities/class_entity.dart';

Future<void> exemploClass(
  Logger logger,
  ClassRepository classRepository,
) async {
  await classRepository.insert(ClassEntity(
    nome: 'SurfSkate BackSide',
    data: null,
  ));

  await classRepository.insert(ClassEntity(
    nome: 'SurfSkate Remada',
    data: null,
  ));

  final classGetAll0 = await classRepository.getByNome('SIDE');
  logger.i(
      'GET BY NOME: ${classGetAll0.map((resultado) => resultado.toMap()).toList()}');

  final classGetAll1 = await classRepository.getAll();
  logger.i(
      'GET ALL: ${classGetAll1.map((resultado) => resultado.toMap()).toList()}');

  int classId = 1;

  ClassEntity? classGet = await classRepository.getById(classId);
  logger.i('GET BY ID: ${classGet?.toMap()}');

  try {
    if (classGet != null) {
      await classRepository.delete(classGet);
    }
  } catch (e) {
    logger.e('ERRO: Erro ao deletar usuário: $e');
  }

  final classGetAll2 = await classRepository.getAll();
  logger.i(
      'GET ALL: ${classGetAll2.map((resultado) => resultado.toMap()).toList()}');
}
