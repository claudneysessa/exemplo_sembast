abstract class IDAO<T> {
  Future<int> insert(T entity);
  Future<List<T>> getAll();
  Future<T?> getById(int entityId);
  Future<void> update(T entity);
  Future<void> delete(T entity);
  Future<void> deleteByKey(int entitykey);
  Future<void> deleteById(int entityId);
  Future<int> getNextId();
}
