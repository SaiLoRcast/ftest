import 'package:elementary/elementary.dart';
import 'package:ftest/data/repository/characters_repository.dart';
import 'package:ftest/domain/character/character.dart';

/// Model for [CharacterListScreen]
class CharactersListScreenModel extends ElementaryModel {
  final CharacterRepository _characterRepository;

  CharactersListScreenModel(
    this._characterRepository,
    ErrorHandler errorHandler,
  ) : super(errorHandler: errorHandler);

  /// Return iterable characters.
  Future<Iterable<Character>> loadCharacters() async {
    try {
      final res = await _characterRepository.getAllCharacters();
      return res;
    } on Exception catch (e) {
      handleError(e);
      rethrow;
    }
  }
}
