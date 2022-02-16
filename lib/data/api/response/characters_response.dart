
import 'package:json_annotation/json_annotation.dart';
import '../entities/character_data.dart';

part 'characters_response.g.dart';

@JsonSerializable()
class CharactersResponse {
  @JsonKey(name: 'data')
  final List<CharacterData> data;

  @JsonKey(name: 'count')
  final int count;

  @JsonKey(name: 'totalPages')
  final int totalPages;

  @JsonKey(name: 'nextPage')
  final String nextPage;

  CharactersResponse(
    this.data,
    this.count,
    this.totalPages,
    this.nextPage,
  );

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
}
