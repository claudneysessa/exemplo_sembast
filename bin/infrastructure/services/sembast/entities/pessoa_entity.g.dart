// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PessoaEntity _$PessoaEntityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'firstName'],
  );
  return PessoaEntity(
    id: (json['id'] as num?)?.toInt(),
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    dateOfBirth: FuncoesData.convertDataJsonToEntity(json['date_of_birth']),
  );
}

Map<String, dynamic> _$PessoaEntityToJson(PessoaEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'date_of_birth': FuncoesData.convertDataEntityson(instance.dateOfBirth),
    };
