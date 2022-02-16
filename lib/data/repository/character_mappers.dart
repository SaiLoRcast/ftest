
import 'package:ftest/data/api/entities/character_data.dart';
import 'package:ftest/domain/character/character.dart';

/// Map Character from CharacterData
Character mapCharacter(CharacterData data) {
  return Character(
    id: data.id,
    name: data.name,
    imageUrl: data.imageUrl,
    url: data.url,
  );
}
