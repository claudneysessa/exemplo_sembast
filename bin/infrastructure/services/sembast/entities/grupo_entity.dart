import 'package:json_annotation/json_annotation.dart';

part 'grupo_entity.g.dart';

@JsonSerializable()
class GrupoEntity {
  @JsonKey(
    required: false,
    includeIfNull: false,
    defaultValue: null,
    includeToJson: true,
  )
  final int? gpCod;

  @JsonKey(
    required: false,
    includeIfNull: false,
    defaultValue: null,
    includeToJson: true,
  )
  final String? gpDes;

  @JsonKey(
    required: false,
    includeIfNull: false,
    defaultValue: null,
    includeToJson: true,
  )
  final String? gpFoto;

  @JsonKey(
    required: false,
    includeIfNull: false,
    defaultValue: null,
    includeToJson: true,
  )
  final DateTime? gpDtmod;

  @JsonKey(
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

  GrupoEntity({
    this.gpCod,
    this.gpDes,
    this.gpFoto,
    this.gpDtmod,
    this.pjeCod,
    this.pjeCod2,
  });

  factory GrupoEntity.fromJson(Map<String, dynamic> json) =>
      _$GrupoEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GrupoEntityToJson(this);
}
