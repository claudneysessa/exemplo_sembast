import 'package:json_annotation/json_annotation.dart';

part 'grupo_dto.g.dart';

@JsonSerializable()
class GrupoDto {
  @JsonKey(
    name: 'GP_COD',
    required: false,
    includeIfNull: false,
    defaultValue: null,
    includeToJson: true,
  )
  final int? gpCod;

  @JsonKey(
    name: 'GP_DES',
    required: false,
    includeIfNull: false,
    defaultValue: null,
    includeToJson: true,
  )
  final String? gpDes;

  @JsonKey(
    name: 'GP_FOTO',
    required: false,
    includeIfNull: false,
    defaultValue: null,
    includeToJson: true,
  )
  final String? gpFoto;

  @JsonKey(
    name: 'GP_DTMOD',
    required: false,
    includeIfNull: false,
    defaultValue: null,
    includeToJson: true,
  )
  final DateTime? gpDtmod;

  @JsonKey(
    name: 'PJE_COD',
    required: false,
    includeIfNull: false,
    defaultValue: null,
    includeToJson: true,
  )
  final int? pjeCod;

  @JsonKey(
    name: 'PJE_COD2',
    required: false,
    includeIfNull: false,
    defaultValue: null,
    includeToJson: true,
  )
  final int? pjeCod2;

  GrupoDto({
    this.gpCod,
    this.gpDes,
    this.gpFoto,
    this.gpDtmod,
    this.pjeCod,
    this.pjeCod2,
  });

  factory GrupoDto.fromJson(Map<String, dynamic> json) =>
      _$GrupoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GrupoDtoToJson(this);
}
