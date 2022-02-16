import 'package:flutter/material.dart';
import 'package:ftest/presentation/Application.dart';
import 'package:ftest/presentation/app_dependencies.dart';

void main() {
  runApp(
    const AppDependencies(
      app: Application(),
    ),
  );
}
