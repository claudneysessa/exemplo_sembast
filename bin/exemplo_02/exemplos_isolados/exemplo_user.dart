import 'package:logger/logger.dart';
import 'package:medina/domain/repositories/user_repository.dart';
import 'package:medina/entities/user_entity.dart';

Future<void> exemploUser(
  Logger logger,
  UserRepository userRepository,
) async {
  await userRepository.insert(UserEntity(
    nome: 'CLAUDNEY',
    data: null,
  ));

  await userRepository.insert(UserEntity(
    nome: 'JULIANA',
    data: null,
  ));

  await userRepository.insert(UserEntity(
    nome: 'ISADORA',
    data: null,
  ));

  await userRepository.insert(UserEntity(
    nome: 'Sidney',
    data: null,
  ));

  await userRepository.insert(UserEntity(
    nome: 'ValdNey',
    data: null,
  ));

  await userRepository.insert(UserEntity(
    nome: 'SIONESIA',
    data: null,
  ));

  await userRepository.insert(UserEntity());

  final usersGetAll0 = await userRepository.getByNome('ney');
  logger.i(
      'GET BY NOME: ${usersGetAll0.map((resultado) => resultado.toMap()).toList()}');

  final usersGetAll1 = await userRepository.getAll();
  logger.i(
      'GET ALL: ${usersGetAll1.map((resultado) => resultado.toMap()).toList()}');

  int userId = 1;

  UserEntity? userGet = await userRepository.getById(userId);
  logger.i('GET BY ID: ${userGet?.toMap()}');

  try {
    if (userGet != null) {
      await userRepository.delete(userGet);
    }
  } catch (e) {
    logger.e('ERRO: Erro ao deletar usuário: $e');
  }

  final usersGetAll2 = await userRepository.getAll();
  logger.i(
      'GET ALL: ${usersGetAll2.map((resultado) => resultado.toMap()).toList()}');
}
