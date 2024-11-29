// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrupoEntity _$GrupoEntityFromJson(Map<String, dynamic> json) => GrupoEntity(
      gpCod: (json['gpCod'] as num?)?.toInt(),
      gpDes: json['gpDes'] as String?,
      gpFoto: json['gpFoto'] as String?,
      gpDtmod: json['gpDtmod'] == null
          ? null
          : DateTime.parse(json['gpDtmod'] as String),
      pjeCod: (json['pjeCod'] as num?)?.toInt(),
      pjeCod2: (json['PJE_COD2'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GrupoEntityToJson(GrupoEntity instance) =>
    <String, dynamic>{
      if (instance.gpCod case final value?) 'gpCod': value,
      if (instance.gpDes case final value?) 'gpDes': value,
      if (instance.gpFoto case final value?) 'gpFoto': value,
      if (instance.gpDtmod?.toIso8601String() case final value?)
        'gpDtmod': value,
      if (instance.pjeCod case final value?) 'pjeCod': value,
      if (instance.pjeCod2 case final value?) 'PJE_COD2': value,
    };
