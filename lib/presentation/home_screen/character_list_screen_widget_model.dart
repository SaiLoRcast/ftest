
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:ftest/domain/character/character.dart';
import 'package:ftest/presentation/home_screen/character_list_screen_model.dart';
import 'package:ftest/presentation/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

import '../../res/theme/app_typography.dart';

/// Factory for [CharacterListScreenWidgetModel]
CharacterListScreenWidgetModel characterListScreenWidgetModelFactory(
  BuildContext context,
) {
  final model = context.read<CharactersListScreenModel>();
  final theme = context.read<ThemeWrapper>();
  return CharacterListScreenWidgetModel(model, theme);
}

/// Widget Model for [CharacterListScreen]
class CharacterListScreenWidgetModel
    extends WidgetModel<HomeScreen, CharactersListScreenModel>
    implements ICharacterListWidgetModel {
  final ThemeWrapper _themeWrapper;

  final _characterListState = EntityStateNotifier<Iterable<Character>>();
  late TextStyle _characterNameStyle;

  @override
  ListenableState<EntityState<Iterable<Character>>> get characterListState =>
      _characterListState;

  @override
  TextStyle get characterNameStyle => _characterNameStyle;

  CharacterListScreenWidgetModel(
      CharactersListScreenModel model,
    this._themeWrapper,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _loadCharacterList();
    _characterNameStyle =
        _themeWrapper.getTextTheme(context).headline4 ?? AppTypography.title3;
  }

  @override
  void onErrorHandle(Object error) {
    super.onErrorHandle(error);

    if (error is DioError &&
        (error.type == DioErrorType.connectTimeout ||
            error.type == DioErrorType.receiveTimeout)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Connection troubles')));
    }
  }

  Future<void> _loadCharacterList() async {
    final previousData = _characterListState.value?.data;
    _characterListState.loading(previousData);

    try {
      final res = await model.loadCharacters();
      _characterListState.content(res);
    } on Exception catch (e) {
      _characterListState.error(e, previousData);
    }
  }
}

/// Interface of [CharacterListScreenWidgetModel]
abstract class ICharacterListWidgetModel extends IWidgetModel {
  ListenableState<EntityState<Iterable<Character>>> get characterListState;

  TextStyle get characterNameStyle;
}
