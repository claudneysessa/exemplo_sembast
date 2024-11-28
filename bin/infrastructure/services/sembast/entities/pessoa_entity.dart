import 'package:json_annotation/json_annotation.dart';
import '../../../../funcoes_data.dart';

part 'pessoa_entity.g.dart';

@JsonSerializable()
class PessoaEntity {
  @JsonKey(
    required: true,
    includeIfNull: true,
    defaultValue: null,
    includeToJson: true,
  )
  final int? id;

  @JsonKey(
    required: true,
    includeIfNull: true,
    defaultValue: null,
    includeToJson: true,
  )
  final String? firstName;

  @JsonKey(
    required: false,
    includeIfNull: true,
    defaultValue: null,
    includeToJson: true,
  )
  final String? lastName;

  @JsonKey(
    name: 'date_of_birth',
    required: false,
    includeIfNull: true,
    defaultValue: null,
    includeToJson: true,
    fromJson: FuncoesData.convertDataJsonToEntity,
    toJson: FuncoesData.convertDataEntityson,
  )
  final DateTime? dateOfBirth;

  PessoaEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
  });

  factory PessoaEntity.fromJson(Map<String, dynamic> json) =>
      _$PessoaEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PessoaEntityToJson(this);
}
