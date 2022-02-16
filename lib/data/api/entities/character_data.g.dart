// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterData _$CharactersFromJson(Map<String, dynamic> json) => CharacterData(

      (json['films'] as List<dynamic>),
          // .map((e) => String.fromJson(e as Map<String, S>))
          // .toList(),
      (json['shortFilms'] as List<dynamic>),
      (json['tvShows'] as List<dynamic>),
      (json['videoGames'] as List<dynamic>),
      (json['parkAttractions'] as List<dynamic>),
      (json['allies'] as List<dynamic>),
      (json['enemies'] as List<dynamic>),
      json['_id'] as int,
      json['name'] as String,
      json['imageUrl'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$CharactersToJson(CharacterData instance) => <String, dynamic>{
      'films': instance.films,
      'shortFilms': instance.shortFilms,
      'tvShows': instance.tvShows,
      'videoGames': instance.videoGames,
      'parkAttractions': instance.parkAttractions,
      'allies': instance.allies,
      'enemies': instance.enemies,
      '_id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'url': instance.url,
    };
