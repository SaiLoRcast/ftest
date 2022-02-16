
import 'package:json_annotation/json_annotation.dart';

part 'character_data.g.dart';

@JsonSerializable()
class CharacterData {
  @JsonKey(name: 'films')
  final List<dynamic> films;

  @JsonKey(name: 'shortFilms')
  final List<dynamic> shortFilms;

  @JsonKey(name: 'tvShows')
  final List<dynamic> tvShows;

  @JsonKey(name: 'videoGames')
  final List<dynamic> videoGames;

  @JsonKey(name: 'parkAttractions')
  final List<dynamic> parkAttractions;

  @JsonKey(name: 'allies')
  final List<dynamic> allies;

  @JsonKey(name: 'enemies')
  final List<dynamic> enemies;

  @JsonKey(name: '_id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'imageUrl')
  final String imageUrl;

  @JsonKey(name: 'url')
  final String url;

  CharacterData(
    this.films,
    this.shortFilms,
    this.tvShows,
    this.videoGames,
    this.parkAttractions,
    this.allies,
    this.enemies,
    this.id,
    this.name,
    this.imageUrl,
    this.url,
  );

  factory CharacterData.fromJson(Map<String, dynamic> json) => _$CharactersFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersToJson(this);
}
