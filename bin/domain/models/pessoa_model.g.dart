// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PessoaModel _$PessoaModelFromJson(Map<String, dynamic> json) => PessoaModel(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$PessoaModelToJson(PessoaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
    };
