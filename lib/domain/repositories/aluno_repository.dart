import '../../infrastructure/data_access/dao/aluno_dao.dart';
import '../../entities/aluno_entity.dart';

class AlunoRepository {
  final AlunoDAO _alunoDAO;

  AlunoRepository(this._alunoDAO);

  Future<int> getNextId() async {
    return await _alunoDAO.getNextId();
  }

  Future<int> insert(AlunoEntity alunoEntity) async {
    return await _alunoDAO.insert(alunoEntity);
  }

  Future<List<AlunoEntity>> getAll() async {
    return await _alunoDAO.getAll();
  }

  Future<List<AlunoEntity>> getByNome(String alunoNome) async {
    return await _alunoDAO.getByNome(alunoNome);
  }

  Future<AlunoEntity?> getById(int alunoId) async {
    return await _alunoDAO.getById(alunoId);
  }

  Future<void> update(AlunoEntity alunoEntity) async {
    await _alunoDAO.update(alunoEntity);
  }

  Future<void> delete(AlunoEntity alunoEntity) async {
    await _alunoDAO.delete(alunoEntity);
  }

  Future<void> deleteById(int alunoId) async {
    await _alunoDAO.deleteById(alunoId);
  }
}
