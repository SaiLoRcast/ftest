// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersResponse _$CharactersResponseFromJson(Map<String, dynamic> json) =>
    CharactersResponse(
      // Character.fromJson(json['data'] as Map<String, dynamic>),
      (json['data'] as List<dynamic>)
          .map((e) => CharacterData.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['count'] as num).toInt(),
      (json['totalPages'] as num).toInt(),
      (json['nextPage'] as String).toString(),
    );

Map<String, dynamic> _$CharactersResponseToJson(CharactersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'count': instance.count,
      'totalPages': instance.totalPages,
      'nextPage': instance.nextPage,
    };
