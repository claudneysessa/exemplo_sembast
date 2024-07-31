import 'package:medina/commons/application_functions.dart';
import 'package:sembast/sembast.dart';

import '../interfaces/dao_interface.dart';
import '../../../entities/class_entity.dart';

class ClassDAO implements IDAO<ClassEntity> {
  final _classStore = intMapStoreFactory.store('classes');
  final Database _database;

  ClassDAO(this._database);

  @override
  Future<int> getNextId() async {
    final records = await _classStore.find(_database);
    if (records.isEmpty) {
      return 1; // Se não houver registros, o próximo ID é 1
    } else {
      final lastRecord = records.last;
      final lastId = lastRecord.value['id'] as int;
      return lastId + 1; // Retorna o último ID + 1
    }
  }

  @override
  Future<int> insert(ClassEntity classEntity) async {
    classEntity.id ??= await getNextId();
    classEntity.data ??= DateTime.now();
    return await _classStore.add(
      _database,
      classEntity.toMap(),
    );
  }

  @override
  Future<List<ClassEntity>> getAll() async {
    final classList = await _classStore.find(_database);
    return classList
        .map(
          (classData) => ClassEntity(
            id: variantToInt(classData.value['id']),
            nome: variantToString(classData.value['nome']),
            data: ifNullParseValue<DateTime>(classData.value['data'],
                parser: DateTime.parse),
          ),
        )
        .toList();
  }

  Future<List<ClassEntity>> getByNome(String nome) async {
    final users = await _classStore.find(_database);

    // Filtrar localmente por nome
    final filteredUsers = users
        .where((user) => user.value['nome']
            .toString()
            .toUpperCase()
            .contains(nome.toUpperCase()))
        .toList();

    // Converter para UserEntity
    return filteredUsers
        .map((user) => ClassEntity(
              id: variantToInt(user.value['id']),
              nome: variantToString(user.value['nome']),
              data: ifNullParseValue<DateTime>(user.value['data'],
                  parser: DateTime.parse),
            ))
        .toList();
  }

  @override
  Future<ClassEntity?> getById(int classId) async {
    final finder = Finder(filter: Filter.equals('id', classId));
    final recordSnapshot =
        await _classStore.findFirst(_database, finder: finder);

    if (recordSnapshot != null) {
      final classData = recordSnapshot.value;
      return ClassEntity(
        id: classData['id'] as int,
        nome: classData['nome'] as String,
        data: ifNullParseValue<DateTime>(classData['data'],
            parser: DateTime.parse),
      );
    }
    return null;
  }

  @override
  Future<void> update(ClassEntity classEntity) async {
    // Encontrar o registro pelo id do User
    final finder = Finder(filter: Filter.equals('id', classEntity.id!));
    final recordSnapshot =
        await _classStore.findFirst(_database, finder: finder);

    if (recordSnapshot != null) {
      final recordId = recordSnapshot.key;
      await _classStore.record(recordId).update(_database, classEntity.toMap());
    }
  }

  @override
  Future<void> delete(ClassEntity classEntity) async {
    // Encontrar a chave do registro usando o id da Class
    final finder = Finder(filter: Filter.equals('id', classEntity.id!));
    final recordSnapshot =
        await _classStore.findFirst(_database, finder: finder);

    if (recordSnapshot != null) {
      // Obter a chave do registro
      final recordId = recordSnapshot.key;

      // Deletar o registro
      await _classStore.record(recordId).delete(_database);
    }
  }

  @override
  Future<void> deleteByKey(int id) async {
    await _classStore.record(id).delete(_database);
  }

  @override
  Future<void> deleteById(int userId) async {
    // Encontrar a chave do registro usando o id do usuário
    final finder =
        Finder(filter: Filter.equals('id', userId)); // Use 'id' como String
    final recordSnapshot =
        await _classStore.findFirst(_database, finder: finder);

    if (recordSnapshot != null) {
      // Obter a chave do registro
      final recordId = recordSnapshot.key;

      // Deletar o registro
      await _classStore.record(recordId).delete(_database);
    }
  }
}
