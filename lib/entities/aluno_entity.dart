class AlunoEntity {
  int? id;
  String? nome;
  String? email;
  String? senha;
  String? dicaSenha;
  String? telefone;
  String? cpf;
  DateTime? data;

  set setId(int id) {
    id = id;
  }

  AlunoEntity({
    this.id,
    this.nome,
    this.email,
    this.senha,
    this.dicaSenha,
    this.telefone,
    this.cpf,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome?.toUpperCase(),
      'email': email,
      'senha': senha,
      'dicaSenha': dicaSenha,
      'telefone': telefone,
      'cpf': cpf,
      'data': data?.toIso8601String(),
    };
  }
}
