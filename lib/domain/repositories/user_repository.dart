import '../../../infrastructure/data_access/dao/user_dao.dart';
import '../../entities/user_entity.dart';

class UserRepository {
  final UserDAO _userDAO;

  UserRepository(this._userDAO);

  Future<int> getNextId() async {
    return await _userDAO.getNextId();
  }

  Future<int> insert(UserEntity user) async {
    return await _userDAO.insert(user);
  }

  Future<List<UserEntity>> getAll() async {
    return await _userDAO.getAll();
  }

  Future<List<UserEntity>> getByNome(String nome) async {
    return await _userDAO.getByNome(nome);
  }

  Future<UserEntity?> getById(int userId) async {
    return await _userDAO.getById(userId);
  }

  Future<void> update(UserEntity user) async {
    await _userDAO.update(user);
  }

  Future<void> delete(UserEntity user) async {
    await _userDAO.delete(user);
  }

  Future<void> deleteById(int userId) async {
    await _userDAO.deleteById(userId);
  }
}
