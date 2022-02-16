import 'package:ftest/data/api/api_service.dart';
import 'package:ftest/data/repository/character_mappers.dart';
import '../../domain/character/character.dart';

/// Character repository
class CharacterRepository {
  final ApiService _client;

  CharacterRepository(this._client);

  /// Return all characters
  Future<Iterable<Character>> getAllCharacters() => _client.getAllCharacters().then(
        (value) => value.data.map(mapCharacter),
      );
}
