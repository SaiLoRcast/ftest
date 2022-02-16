import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:ftest/domain/character/character.dart';

import 'character_list_screen_widget_model.dart';

class HomeScreen extends ElementaryWidget<ICharacterListWidgetModel> {
  const HomeScreen({
    Key? key,
    WidgetModelFactory wmFactory = characterListScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICharacterListWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disney characters'),
      ),
      body: EntityStateNotifierBuilder<Iterable<Character>>(
        listenableEntityState: wm.characterListState,
        loadingBuilder: (_, __) => const _LoadingWidget(),
        errorBuilder: (_, __, ___) => const _ErrorWidget(),
        builder: (_, characters) =>
            _CharacterList(
              characters: characters,
              nameStyle: wm.characterNameStyle,
            ),
      ),
    );
    //
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('loading'),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error'),
    );
  }
}


class _CharacterList extends StatelessWidget {
  final Iterable<Character>? characters;
  final TextStyle nameStyle;

  const _CharacterList({
    Key? key,
    required this.characters,
    required this.nameStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characters = this.characters;

    if (characters == null || characters.isEmpty) {
      return const _EmptyList();
    }

    return ListView.separated(
      itemBuilder: (_, index) => _CharacterWidget(
        data: characters.elementAt(index),
        characterNameStyle: nameStyle,
      ),
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemCount: characters.length,
      cacheExtent: 800,
    );
  }
}

class _EmptyList extends StatelessWidget {
  const _EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Список пуст'),
    );
  }
}

class _CharacterWidget extends StatelessWidget {
  final Character data;
  final TextStyle characterNameStyle;

  const _CharacterWidget({
    Key? key,
    required this.data,
    required this.characterNameStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              transform: Matrix4.rotationZ(-0.2)
                ..scale(1.2)
                ..translate(-50.0),
              height: 250,
              width: double.infinity,
              child: Image.network(
                data.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  children: [
                    const Spacer(),
                    Container(
                      constraints: constraints.copyWith(minWidth: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white70,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data.name,
                        style: characterNameStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

