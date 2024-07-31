class UserEntity {
  int? id;
  String? nome;
  DateTime? data;

  set setId(int id) {
    id = id;
  }

  UserEntity({
    this.id,
    this.nome,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome?.toUpperCase(),
      'data': data?.toIso8601String(),
    };
  }
}
