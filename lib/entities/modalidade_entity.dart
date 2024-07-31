import 'dart:ffi';

class ModalidadeEntity {
  int? id;
  String? nome;
  String? descricao;
  DateTime? data;

  set setId(int id) {
    id = id;
  }

  ModalidadeEntity({
    this.id,
    this.nome,
    this.descricao,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome?.toUpperCase(),
      'descricao': descricao,
      'data': data?.toIso8601String(),
    };
  }
}
