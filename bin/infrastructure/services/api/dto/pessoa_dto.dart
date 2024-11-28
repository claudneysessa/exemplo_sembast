import 'package:json_annotation/json_annotation.dart';
import '../../../../funcoes_data.dart';

part 'pessoa_dto.g.dart';

@JsonSerializable()
class PessoaDto {
  @JsonKey(
    name: 'id',
    required: true,
    includeIfNull: true,
    defaultValue: null,
    includeToJson: true,
  )
  final int? id;

  @JsonKey(
    name: 'first_name',
    required: true,
    includeIfNull: true,
    defaultValue: null,
    includeToJson: true,
  )
  final String? firstName;

  @JsonKey(
    name: 'last_name',
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

  PessoaDto({
    this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
  });

  factory PessoaDto.fromJson(Map<String, dynamic> json) =>
      _$PessoaDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PessoaDtoToJson(this);
}
