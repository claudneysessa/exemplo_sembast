// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PessoaDto _$PessoaDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'first_name'],
  );
  return PessoaDto(
    id: (json['id'] as num?)?.toInt(),
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    dateOfBirth: FuncoesData.convertDataJsonToEntity(json['date_of_birth']),
  );
}

Map<String, dynamic> _$PessoaDtoToJson(PessoaDto instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'date_of_birth': FuncoesData.convertDataEntityson(instance.dateOfBirth),
    };
