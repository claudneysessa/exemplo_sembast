// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrupoModel _$GrupoModelFromJson(Map<String, dynamic> json) => GrupoModel(
      gpCod: (json['gpCod'] as num?)?.toInt(),
      gpDes: json['gpDes'] as String?,
      gpFoto: json['gpFoto'] as String?,
      gpDtmod: json['gpDtmod'] == null
          ? null
          : DateTime.parse(json['gpDtmod'] as String),
      pjeCod: (json['pjeCod'] as num?)?.toInt(),
      pjeCod2: (json['pjeCod2'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GrupoModelToJson(GrupoModel instance) =>
    <String, dynamic>{
      'gpCod': instance.gpCod,
      'gpDes': instance.gpDes,
      'gpFoto': instance.gpFoto,
      'gpDtmod': instance.gpDtmod?.toIso8601String(),
      'pjeCod': instance.pjeCod,
      'pjeCod2': instance.pjeCod2,
    };
