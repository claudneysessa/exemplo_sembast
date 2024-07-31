import 'package:exemplo_sembast/commons/application_functions.dart';
import 'package:sembast/sembast.dart';

import '../interfaces/dao_interface.dart';
import '../../../entities/modalidade_entity.dart';

class ModalidadeDAO implements IDAO<ModalidadeEntity> {
  final _modalidadeStore = intMapStoreFactory.store('modalidades');
  final Database _database;

  ModalidadeDAO(this._database);

  @override
  Future<int> getNextId() async {
    final modalidadesList = await _modalidadeStore.find(_database);
    if (modalidadesList.isEmpty) {
      return 1; // Se não houver registros, o próximo ID é 1
    } else {
      final ultimaModalidade = modalidadesList.last;
      final ultimoID = ultimaModalidade.value['id'] as int;
      return ultimoID + 1; // Retorna o último ID + 1
    }
  }

  @override
  Future<int> insert(ModalidadeEntity modalidade) async {
    modalidade.id ??= await getNextId();
    modalidade.data ??= DateTime.now();
    return await _modalidadeStore.add(
      _database,
      modalidade.toMap(),
    );
  }

  @override
  Future<List<ModalidadeEntity>> getAll() async {
    final modalidadeList = await _modalidadeStore.find(_database);
    return modalidadeList
        .map(
          (modalidadeData) => ModalidadeEntity(
            id: variantToInt(modalidadeData.value['id']),
            nome: variantToString(modalidadeData.value['nome']),
            data: ifNullParseValue<DateTime>(
              modalidadeData.value['data'],
              parser: DateTime.parse,
            ),
          ),
        )
        .toList();
  }

  Future<List<ModalidadeEntity>> getByNome(String modalidadeNome) async {
    final listaModalidades = await _modalidadeStore.find(_database);

    // Filtrar localmente por nome
    final filtroModalidades = listaModalidades
        .where(
          (modalidadeData) =>
              modalidadeData.value['nome'].toString().toUpperCase().contains(
                    modalidadeNome.toUpperCase(),
                  ),
        )
        .toList();

    // Converter para ModalidadeEntity
    return filtroModalidades
        .map(
          (modalidadeData) => ModalidadeEntity(
            id: variantToInt(modalidadeData.value['id']),
            nome: variantToString(modalidadeData.value['nome']),
            data: ifNullParseValue<DateTime>(
              modalidadeData.value['data'],
              parser: DateTime.parse,
            ),
          ),
        )
        .toList();
  }

  @override
  Future<ModalidadeEntity?> getById(int modalidadeId) async {
    final finder = Finder(
      filter: Filter.equals(
        'id',
        modalidadeId,
      ),
    );

    final modalidadeData = await _modalidadeStore.findFirst(
      _database,
      finder: finder,
    );

    if (modalidadeData != null) {
      final modalidade = modalidadeData.value;
      return ModalidadeEntity(
        id: modalidade['id'] as int,
        nome: modalidade['nome'] as String,
        data: ifNullParseValue<DateTime>(
          modalidade['data'],
          parser: DateTime.parse,
        ),
      );
    }
    return null;
  }

  @override
  Future<void> update(ModalidadeEntity modalidadeEntity) async {
    // Encontrar o registro pelo id da modalidade
    final finder = Finder(
      filter: Filter.equals(
        'id',
        modalidadeEntity.id!,
      ),
    );

    final modalidadeData = await _modalidadeStore.findFirst(
      _database,
      finder: finder,
    );

    if (modalidadeData != null) {
      final recordId = modalidadeData.key;
      await _modalidadeStore.record(recordId).update(
            _database,
            modalidadeEntity.toMap(),
          );
    }
  }

  @override
  Future<void> delete(ModalidadeEntity modalidadeEntity) async {
    // Encontrar a chave do registro usando o id da Modalidade
    final finder = Finder(
      filter: Filter.equals(
        'id',
        modalidadeEntity.id!,
      ),
    );

    final modalidadeData = await _modalidadeStore.findFirst(
      _database,
      finder: finder,
    );

    if (modalidadeData != null) {
      // Obter a chave do registro
      final recordId = modalidadeData.key;

      // Deletar o registro
      await _modalidadeStore.record(recordId).delete(_database);
    }
  }

  @override
  Future<void> deleteByKey(int modalidadeId) async {
    await _modalidadeStore.record(modalidadeId).delete(_database);
  }

  @override
  Future<void> deleteById(int modalidadeId) async {
    // Encontrar a chave do registro usando o id do usuário
    final finder = Finder(
      filter: Filter.equals(
        'id',
        modalidadeId,
      ),
    ); // Use 'id' como String

    final modalidadeData = await _modalidadeStore.findFirst(
      _database,
      finder: finder,
    );

    if (modalidadeData != null) {
      // Obter a chave do registro
      final recordId = modalidadeData.key;

      // Deletar o registro
      await _modalidadeStore.record(recordId).delete(_database);
    }
  }
}
