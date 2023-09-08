import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_repo/application/state/http_client.dart';
import 'package:search_repo/application/state/them_model.dart';
import 'package:search_repo/domain/types/repo_model.dart';
import 'package:search_repo/presentation/theme/color.dart';
import 'package:search_repo/presentation/theme/them_data/dark_them.dart';
import 'package:search_repo/presentation/widget/repo_list.dart';
import 'package:http/http.dart' as http;
import 'package:search_repo/presentation/widget/search_app_bar.dart';
import '../http_mocks.dart';
import '../mock_data.dart';
/// Themのテスト
void main() {
  group('Error,Loading,Emptyのテスト', () {
    test('DarkThemテーマが反映されているかのテスト', () async {
      const fakeThemeMode = ThemeMode.dark;
      final container = ProviderContainer(overrides: [
        themeModeProvider.overrideWithValue(fakeThemeMode),
      ]);
      final currentThemeMode = container.read(themeModeProvider);
      expect(currentThemeMode, ThemeMode.dark);
    });

    test('LightThemテーマが反映されているかのテスト', () async {
      const fakeThemeMode = ThemeMode.light;
      final container = ProviderContainer(overrides: [
        themeModeProvider.overrideWithValue(fakeThemeMode),
      ]);
      final currentThemeMode = container.read(themeModeProvider);
      expect(currentThemeMode, ThemeMode.light);
    });
  });
}
