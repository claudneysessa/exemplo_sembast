import 'package:json_annotation/json_annotation.dart';
import '../../funcoes_data.dart';

part 'pessoa_model.g.dart';

@JsonSerializable()
class PessoaModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;

  PessoaModel({
    this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
  });

  factory PessoaModel.fromJson(Map<String, dynamic> json) {
    return _$PessoaModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PessoaModelToJson(this);
  }
}
