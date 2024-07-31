import 'package:medina/commons/application_functions.dart';
import 'package:sembast/sembast.dart';

import '../interfaces/dao_interface.dart';
import '../../../entities/user_entity.dart';

class UserDAO implements IDAO<UserEntity> {
  final _userStore = intMapStoreFactory.store('users');
  final Database _database;

  UserDAO(this._database);

  @override
  Future<int> getNextId() async {
    final records = await _userStore.find(_database);
    if (records.isEmpty) {
      return 1; // Se não houver registros, o próximo ID é 1
    } else {
      final lastRecord = records.last;
      final lastId = lastRecord.value['id'] as int;
      return lastId + 1; // Retorna o último ID + 1
    }
  }

  @override
  Future<int> insert(UserEntity userEntity) async {
    userEntity.id ??= await getNextId();
    userEntity.data ??= DateTime.now();
    return await _userStore.add(
      _database,
      userEntity.toMap(),
    );
  }

  @override
  Future<List<UserEntity>> getAll() async {
    final userList = await _userStore.find(_database);
    return userList
        .map(
          (userData) => UserEntity(
            id: variantToInt(userData.value['id']),
            nome: variantToString(userData.value['nome']),
            data: ifNullParseValue<DateTime>(userData.value['data'],
                parser: DateTime.parse),
          ),
        )
        .toList();
  }

  Future<List<UserEntity>> getByNome(String nome) async {
    final users = await _userStore.find(_database);

    // Filtrar localmente por nome
    final filteredUsers = users
        .where((user) => user.value['nome']
            .toString()
            .toUpperCase()
            .contains(nome.toUpperCase()))
        .toList();

    // Converter para UserEntity
    return filteredUsers
        .map((user) => UserEntity(
              id: variantToInt(user.value['id']),
              nome: variantToString(user.value['nome']),
              data: ifNullParseValue<DateTime>(user.value['data'],
                  parser: DateTime.parse),
            ))
        .toList();
  }

  @override
  Future<UserEntity?> getById(int userId) async {
    final finder = Finder(filter: Filter.equals('id', userId));
    final recordSnapshot =
        await _userStore.findFirst(_database, finder: finder);

    if (recordSnapshot != null) {
      final userData = recordSnapshot.value;
      return UserEntity(
        id: userData['id'] as int,
        nome: userData['nome'] as String,
        data: ifNullParseValue<DateTime>(userData['data'],
            parser: DateTime.parse),
      );
    }
    return null;
  }

  @override
  Future<void> update(UserEntity userEntity) async {
    // Encontrar o registro pelo id do User
    final finder = Finder(filter: Filter.equals('id', userEntity.id!));
    final recordSnapshot =
        await _userStore.findFirst(_database, finder: finder);

    if (recordSnapshot != null) {
      final recordId = recordSnapshot.key;
      await _userStore.record(recordId).update(_database, userEntity.toMap());
    }
  }

  @override
  Future<void> delete(UserEntity classEntity) async {
    // Encontrar a chave do registro usando o id da Class
    final finder = Finder(filter: Filter.equals('id', classEntity.id!));
    final recordSnapshot =
        await _userStore.findFirst(_database, finder: finder);

    if (recordSnapshot != null) {
      // Obter a chave do registro
      final recordId = recordSnapshot.key;

      // Deletar o registro
      await _userStore.record(recordId).delete(_database);
    }
  }

  @override
  Future<void> deleteByKey(int key) async {
    await _userStore.record(key).delete(_database);
  }

  @override
  Future<void> deleteById(int userId) async {
    // Encontrar a chave do registro usando o id do usuário
    final finder =
        Finder(filter: Filter.equals('id', userId)); // Use 'id' como String
    final recordSnapshot =
        await _userStore.findFirst(_database, finder: finder);

    if (recordSnapshot != null) {
      // Obter a chave do registro
      final recordId = recordSnapshot.key;

      // Deletar o registro
      await _userStore.record(recordId).delete(_database);
    }
  }
}
