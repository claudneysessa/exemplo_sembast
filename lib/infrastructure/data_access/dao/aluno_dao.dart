import 'package:exemplo_sembast/commons/application_functions.dart';
import 'package:sembast/sembast.dart';

import '../interfaces/dao_interface.dart';
import '../../../entities/aluno_entity.dart';

class AlunoDAO implements IDAO<AlunoEntity> {
  final _alunoStore = intMapStoreFactory.store('alunos');
  final Database _database;

  AlunoDAO(this._database);

  @override
  Future<int> getNextId() async {
    final alunosList = await _alunoStore.find(_database);
    if (alunosList.isEmpty) {
      return 1; // Se não houver registros, o próximo ID é 1
    } else {
      final ultimoAluno = alunosList.last;
      final ultimoId = ultimoAluno.value['id'] as int;
      return ultimoId + 1; // Retorna o último ID + 1
    }
  }

  @override
  Future<int> insert(AlunoEntity alunoEntity) async {
    alunoEntity.id ??= await getNextId();
    alunoEntity.data ??= DateTime.now();
    return await _alunoStore.add(
      _database,
      alunoEntity.toMap(),
    );
  }

  @override
  Future<List<AlunoEntity>> getAll() async {
    final alunosList = await _alunoStore.find(_database);
    return alunosList
        .map(
          (alunoData) => AlunoEntity(
            id: variantToInt(alunoData.value['id']),
            nome: variantToString(alunoData.value['nome']),
            data: ifNullParseValue<DateTime>(
              alunoData.value['data'],
              parser: DateTime.parse,
            ),
          ),
        )
        .toList();
  }

  Future<List<AlunoEntity>> getByNome(String alunoNome) async {
    final alunosList = await _alunoStore.find(_database);

    // Filtrar localmente por nome
    final filtroAlunos = alunosList
        .where(
          (alunoData) =>
              alunoData.value['nome'].toString().toUpperCase().contains(
                    alunoNome.toUpperCase(),
                  ),
        )
        .toList();

    // Converter para AlunoEntity
    return filtroAlunos
        .map(
          (alunoData) => AlunoEntity(
            id: variantToInt(alunoData.value['id']),
            nome: variantToString(alunoData.value['nome']),
            data: ifNullParseValue<DateTime>(
              alunoData.value['data'],
              parser: DateTime.parse,
            ),
          ),
        )
        .toList();
  }

  @override
  Future<AlunoEntity?> getById(int alunoId) async {
    final finder = Finder(
      filter: Filter.equals(
        'id',
        alunoId,
      ),
    );

    final alunoData = await _alunoStore.findFirst(
      _database,
      finder: finder,
    );

    if (alunoData != null) {
      final aluno = alunoData.value;
      return AlunoEntity(
        id: aluno['id'] as int,
        nome: aluno['nome'] as String,
        data: ifNullParseValue<DateTime>(
          aluno['data'],
          parser: DateTime.parse,
        ),
      );
    }
    return null;
  }

  @override
  Future<void> update(AlunoEntity alunoEntity) async {
    // Encontrar o registro pelo id do Aluno
    final finder = Finder(
      filter: Filter.equals(
        'id',
        alunoEntity.id!,
      ),
    );

    final alunoData = await _alunoStore.findFirst(
      _database,
      finder: finder,
    );

    if (alunoData != null) {
      final recordId = alunoData.key;
      await _alunoStore.record(recordId).update(
            _database,
            alunoEntity.toMap(),
          );
    }
  }

  @override
  Future<void> delete(AlunoEntity alunoEntity) async {
    // Encontrar a chave do registro usando o id do Aluno
    final finder = Finder(
      filter: Filter.equals(
        'id',
        alunoEntity.id!,
      ),
    );

    final alunoData = await _alunoStore.findFirst(
      _database,
      finder: finder,
    );

    if (alunoData != null) {
      // Obter a chave do registro
      final recordId = alunoData.key;

      // Deletar o registro
      await _alunoStore.record(recordId).delete(_database);
    }
  }

  @override
  Future<void> deleteByKey(int alunoKey) async {
    await _alunoStore.record(alunoKey).delete(_database);
  }

  @override
  Future<void> deleteById(int alunoId) async {
    // Encontrar a chave do registro usando o id do usuário
    final finder = Finder(
      filter: Filter.equals(
        'id',
        alunoId,
      ),
    ); // Use 'id' como String

    final alunoData = await _alunoStore.findFirst(
      _database,
      finder: finder,
    );

    if (alunoData != null) {
      // Obter a chave do registro
      final recordId = alunoData.key;

      // Deletar o registro
      await _alunoStore.record(recordId).delete(_database);
    }
  }
}
