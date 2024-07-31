import 'package:logger/logger.dart';
import 'package:exemplo_sembast/domain/repositories/modalidade_repository.dart';
import 'package:exemplo_sembast/entities/modalidade_entity.dart';

Future<void> exemploModalidade(
  Logger logger,
  ModalidadeRepository modalidadeRepository,
) async {
  await modalidadeRepository.insert(ModalidadeEntity(
    nome: 'SurfSkate BackSide',
    data: null,
  ));

  await modalidadeRepository.insert(ModalidadeEntity(
    nome: 'SurfSkate Remada',
    data: null,
  ));

  final modalidadeGetAll0 = await modalidadeRepository.getByNome('SIDE');
  logger.i(
      'gteByNome: ${modalidadeGetAll0.map((modalidade) => modalidade.toMap()).toList()}');

  final modalidadeGetAll1 = await modalidadeRepository.getAll();
  logger.i(
      'getAll: ${modalidadeGetAll1.map((modalidade) => modalidade.toMap()).toList()}');

  int modalidadeId = 1;

  ModalidadeEntity? modalidadeGet =
      await modalidadeRepository.getById(modalidadeId);
  logger.i('getById: ${modalidadeGet?.toMap()}');

  try {
    if (modalidadeGet != null) {
      await modalidadeRepository.delete(modalidadeGet);
    }
  } catch (e) {
    logger.e('error: Erro ao deletar usuário: $e');
  }

  final modalidadeGetAll2 = await modalidadeRepository.getAll();
  logger.i(
      'getAll: ${modalidadeGetAll2.map((modalidade) => modalidade.toMap()).toList()}');
}
