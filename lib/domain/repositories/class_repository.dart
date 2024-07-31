import '../../../infrastructure/data_access/dao/class_dao.dart';
import '../../entities/class_entity.dart';

class ClassRepository {
  final ClassDAO _classDAO;

  ClassRepository(this._classDAO);

  Future<int> getNextId() async {
    return await _classDAO.getNextId();
  }

  Future<int> insert(ClassEntity classe) async {
    return await _classDAO.insert(classe);
  }

  Future<List<ClassEntity>> getAll() async {
    return await _classDAO.getAll();
  }

  Future<List<ClassEntity>> getByNome(String nome) async {
    return await _classDAO.getByNome(nome);
  }

  Future<ClassEntity?> getById(int classId) async {
    return await _classDAO.getById(classId);
  }

  Future<void> update(ClassEntity classe) async {
    await _classDAO.update(classe);
  }

  Future<void> delete(ClassEntity classe) async {
    await _classDAO.delete(classe);
  }

  Future<void> deleteById(int classId) async {
    await _classDAO.deleteById(classId);
  }
}
