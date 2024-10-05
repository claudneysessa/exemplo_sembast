import '../../infrastructure/data_access/dao/ticker_dao.dart';
import '../entities/ticker_entity.dart';

class TickerRepository {
  final TickerDAO _tickerDAO;

  TickerRepository(this._tickerDAO);

  Future<int> getNextId() async {
    return await _tickerDAO.getNextId();
  }

  Future<int> insert(TickerEntity tickerEntity) async {
    return await _tickerDAO.insert(tickerEntity);
  }

  Future<List<TickerEntity>> getAll() async {
    return await _tickerDAO.getAll();
  }

  Future<List<TickerEntity>> getByField(
    String fieldName,
    dynamic fieldValue,
  ) async {
    return await _tickerDAO.getByField(
      fieldName,
      fieldValue,
    );
  }

  Future<TickerEntity?> getById(int tickerId) async {
    return await _tickerDAO.getById(tickerId);
  }

  Future<void> update(TickerEntity tickerEntity) async {
    await _tickerDAO.update(tickerEntity);
  }

  Future<void> delete(TickerEntity tickerEntity) async {
    await _tickerDAO.delete(tickerEntity);
  }

  Future<void> deleteById(int tickerId) async {
    await _tickerDAO.deleteById(tickerId);
  }

  Future<void> deleteAll(List<TickerEntity> entities) async {
    await _tickerDAO.deleteAll(entities);
  }

  Future<List<int>> insertAll(List<TickerEntity> entities) async {
    return await _tickerDAO.insertAll(entities);
  }

  Future<void> updateAll(List<TickerEntity> entities) async {
    await _tickerDAO.updateAll(entities);
  }
}
