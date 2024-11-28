import 'package:sembast/sembast.dart';

abstract class IDAO<T> {
  String get tableName;
  List<String> get primaryKey;
  StoreRef<int, Map<String, dynamic>> get store;
  Database get database;

  Future<int> getNextId();
  Future<int> insert(T entity);
  Future<List<int>> insertAll(List<T> entities);
  Future<void> update(T entity);
  Future<void> updateAll(List<T> entities);
  Future<void> delete(T entity);
  Future<void> deleteByKey(int entitykey);
  Future<void> deleteById(int entityId);
  Future<void> deleteAll(List<T> entities);
  Future<List<T>> getAll();
  Future<T?> getById(int entityId);
  Future<List<T>> getByField(String fieldName, dynamic fieldValue);
}
