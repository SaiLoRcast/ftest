import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:ftest/data/api/api_service.dart';
import 'package:ftest/data/repository/characters_repository.dart';
import 'package:ftest/presentation/Application.dart';
import 'package:provider/provider.dart';

import '../utils/error/default_error_handler.dart';
import 'home_screen/character_list_screen_model.dart';


/// Widget with dependencies that live all runtime.
class AppDependencies extends StatefulWidget {
  final Application app;

  const AppDependencies({required this.app, Key? key}) : super(key: key);

  @override
  State<AppDependencies> createState() => _AppDependenciesState();
}

class _AppDependenciesState extends State<AppDependencies> {
  late final Dio _http;
  late final DefaultErrorHandler _defaultErrorHandler;
  late final ApiService _apiClient;
  late final CharacterRepository _characterRepository;
  late final CharactersListScreenModel _characterListScreenModel;

  late final ThemeWrapper _themeWrapper;

  @override
  void initState() {
    super.initState();

    _http = Dio();
    _defaultErrorHandler = DefaultErrorHandler();
    _apiClient = ApiService(_http);
    _characterRepository = CharacterRepository(_apiClient);
    _characterListScreenModel = CharactersListScreenModel(
      _characterRepository,
      _defaultErrorHandler,
    );

    _themeWrapper = ThemeWrapper();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CharactersListScreenModel>(
          create: (_) => _characterListScreenModel,
        ),
        Provider<ThemeWrapper>(
          create: (_) => _themeWrapper,
        ),
      ],
      child: widget.app,
    );
  }
}
