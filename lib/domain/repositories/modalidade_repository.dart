import '../../infrastructure/data_access/dao/modalidade_dao.dart';
import '../../entities/modalidade_entity.dart';

class ModalidadeRepository {
  final ModalidadeDAO _modalidadeDAO;

  ModalidadeRepository(this._modalidadeDAO);

  Future<int> getNextId() async {
    return await _modalidadeDAO.getNextId();
  }

  Future<int> insert(ModalidadeEntity modalidadeEntity) async {
    return await _modalidadeDAO.insert(modalidadeEntity);
  }

  Future<List<ModalidadeEntity>> getAll() async {
    return await _modalidadeDAO.getAll();
  }

  Future<List<ModalidadeEntity>> getByNome(String modalidadeNome) async {
    return await _modalidadeDAO.getByNome(modalidadeNome);
  }

  Future<ModalidadeEntity?> getById(int modalidadeId) async {
    return await _modalidadeDAO.getById(modalidadeId);
  }

  Future<void> update(ModalidadeEntity modalidadeEntity) async {
    await _modalidadeDAO.update(modalidadeEntity);
  }

  Future<void> delete(ModalidadeEntity modalidadeEntity) async {
    await _modalidadeDAO.delete(modalidadeEntity);
  }

  Future<void> deleteById(int modalidadeId) async {
    await _modalidadeDAO.deleteById(modalidadeId);
  }
}
