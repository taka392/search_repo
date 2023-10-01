import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_repo/application/state/them_model.dart';

/// Themのテスト
void main() {
  test('DarkThemテーマが反映されているかのテスト', () async {
    const fakeThemeMode = ThemeMode.dark;
    final container = ProviderContainer(
      overrides: [
        themeModeProvider.overrideWithValue(fakeThemeMode),
      ],
    );
    final currentThemeMode = container.read(themeModeProvider);
    expect(currentThemeMode, ThemeMode.dark);
  });

  test('LightThemテーマが反映されているかのテスト', () async {
    const fakeThemeMode = ThemeMode.light;
    final container = ProviderContainer(
      overrides: [
        themeModeProvider.overrideWithValue(fakeThemeMode),
      ],
    );
    final currentThemeMode = container.read(themeModeProvider);
    expect(currentThemeMode, ThemeMode.light);
  });
}
