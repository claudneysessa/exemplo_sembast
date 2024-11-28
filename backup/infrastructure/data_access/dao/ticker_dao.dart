import '../../../commons/application_functions.dart';
import 'package:sembast/sembast.dart';

import '../interfaces/dao_interface.dart';
import '../../../domain/entities/ticker_entity.dart';

class TickerDAO implements IDAO<TickerEntity> {
  final Database _database;

  StoreRef<int, Map<String, Object?>> getStore(String storeName) {
    return intMapStoreFactory.store(storeName);
  }

  @override
  get tableName => 'tiker';
  @override
  get primaryKey => ['id'];
  @override
  get database => _database;
  @override
  get store => getStore(tableName);

  TickerDAO(this._database);

  @override
  Future<int> getNextId() async {
    final tickersList = await store.find(database);
    if (tickersList.isEmpty) {
      return 1; // Se não houver registros, o próximo ID é 1
    } else {
      final ultimoticker = tickersList.last;
      final ultimoId = ultimoticker.value['id'] as int;
      return ultimoId + 1; // Retorna o último ID + 1
    }
  }

  @override
  Future<int> insert(TickerEntity tickerEntity) async {
    tickerEntity.id ??= await getNextId();
    return await store.add(
      _database,
      tickerEntity.toMap(),
    );
  }

  @override
  Future<List<int>> insertAll(List<TickerEntity> entities) async {
    final keys = <int>[];
    for (final entity in entities) {
      final key = await insert(entity);
      keys.add(key);
    }
    return keys;
  }

  @override
  Future<void> update(TickerEntity tickerEntity) async {
    // Encontrar o registro pelo id do ticker
    final finder = Finder(
      filter: Filter.equals(
        'id',
        tickerEntity.id!,
      ),
    );

    final tickerData = await store.findFirst(
      _database,
      finder: finder,
    );

    if (tickerData != null) {
      final recordId = tickerData.key;
      await store.record(recordId).update(
            _database,
            tickerEntity.toMap(),
          );
    }
  }

  @override
  Future<void> updateAll(List<TickerEntity> entities) async {
    for (final entity in entities) {
      await update(entity);
    }
  }

  @override
  Future<void> delete(TickerEntity tickerEntity) async {
    // Encontrar a chave do registro usando o id do ticker
    final finder = Finder(
      filter: Filter.equals(
        'id',
        tickerEntity.id!,
      ),
    );

    final tickerData = await store.findFirst(
      _database,
      finder: finder,
    );

    if (tickerData != null) {
      // Obter a chave do registro
      final recordId = tickerData.key;

      // Deletar o registro
      await store.record(recordId).delete(_database);
    }
  }

  @override
  Future<void> deleteAll(List<TickerEntity> entities) async {
    for (final entity in entities) {
      await delete(entity);
    }
  }

  @override
  Future<void> deleteByKey(int tickerKey) async {
    await store.record(tickerKey).delete(_database);
  }

  @override
  Future<void> deleteById(int tickerId) async {
    // Encontrar a chave do registro usando o id do usuário
    final finder = Finder(
      filter: Filter.equals(
        'id',
        tickerId,
      ),
    ); // Use 'id' como String

    final tickerData = await store.findFirst(
      _database,
      finder: finder,
    );

    if (tickerData != null) {
      // Obter a chave do registro
      final recordId = tickerData.key;

      // Deletar o registro
      await store.record(recordId).delete(_database);
    }
  }

  @override
  Future<List<TickerEntity>> getAll() async {
    final tickersList = await store.find(_database);
    return tickersList
        .map(
          (tickerData) => TickerEntity(
            id: variantToInt(tickerData.value['id']),
            stock: variantToString(tickerData.value['stock']),
            name: variantToString(tickerData.value['name']),
            logo: variantToString(tickerData.value['logo']),
            sector: variantToString(tickerData.value['sector']),
            type: variantToString(tickerData.value['type']),
          ),
        )
        .toList();
  }

  @override
  Future<List<TickerEntity>> getByField(
    String fieldName,
    dynamic fieldValue,
  ) async {
    final tickersList = await store.find(_database);

    // Filtrar localmente por nome
    final filtrotickers = tickersList
        .where(
          (tickerData) =>
              tickerData.value[fieldName].toString().toUpperCase().contains(
                    fieldValue.toString().toUpperCase(),
                  ),
        )
        .toList();

    // Converter para tickerEntity
    return filtrotickers
        .map(
          (tickerData) => TickerEntity(
            id: variantToInt(tickerData.value['id']),
            stock: variantToString(tickerData.value['stock']),
            name: variantToString(tickerData.value['name']),
            logo: variantToString(tickerData.value['logo']),
            sector: variantToString(tickerData.value['sector']),
            type: variantToString(tickerData.value['type']),
          ),
        )
        .toList();
  }

  @override
  Future<TickerEntity?> getById(int tickerId) async {
    final finder = Finder(
      filter: Filter.equals(
        'id',
        tickerId,
      ),
    );

    final tickerData = await store.findFirst(
      _database,
      finder: finder,
    );

    if (tickerData != null) {
      final ticker = tickerData.value;
      return TickerEntity(
        id: variantToInt(ticker['id']),
        stock: variantToString(ticker['stock']),
        name: variantToString(ticker['name']),
        logo: variantToString(ticker['logo']),
        sector: variantToString(ticker['sector']),
        type: variantToString(ticker['type']),
      );
    }
    return null;
  }
}
