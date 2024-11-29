import 'package:json_annotation/json_annotation.dart';

part 'grupo_model.g.dart';

@JsonSerializable()
class GrupoModel {
  final int? gpCod;
  final String? gpDes;
  final String? gpFoto;
  final DateTime? gpDtmod;
  final int? pjeCod;
  final int? pjeCod2;

  GrupoModel({
    this.gpCod,
    this.gpDes,
    this.gpFoto,
    this.gpDtmod,
    this.pjeCod,
    this.pjeCod2,
  });

  factory GrupoModel.fromJson(Map<String, dynamic> json) {
    return _$GrupoModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GrupoModelToJson(this);
  }
}
