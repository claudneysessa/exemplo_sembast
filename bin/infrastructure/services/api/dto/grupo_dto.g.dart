// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrupoDto _$GrupoDtoFromJson(Map<String, dynamic> json) => GrupoDto(
      gpCod: (json['GP_COD'] as num?)?.toInt(),
      gpDes: json['GP_DES'] as String?,
      gpFoto: json['GP_FOTO'] as String?,
      gpDtmod: json['GP_DTMOD'] == null
          ? null
          : DateTime.parse(json['GP_DTMOD'] as String),
      pjeCod: (json['PJE_COD'] as num?)?.toInt(),
      pjeCod2: (json['PJE_COD2'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GrupoDtoToJson(GrupoDto instance) => <String, dynamic>{
      if (instance.gpCod case final value?) 'GP_COD': value,
      if (instance.gpDes case final value?) 'GP_DES': value,
      if (instance.gpFoto case final value?) 'GP_FOTO': value,
      if (instance.gpDtmod?.toIso8601String() case final value?)
        'GP_DTMOD': value,
      if (instance.pjeCod case final value?) 'PJE_COD': value,
      if (instance.pjeCod2 case final value?) 'PJE_COD2': value,
    };
