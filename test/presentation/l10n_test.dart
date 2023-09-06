import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_repo/application/state/l10n/applocalizatons_provider.dart';
import 'package:search_repo/application/state/l10n/locate.dart';
void main() {
  group('多言語変換テスト', () {
    test('多言語変換テスト', () async {
      //repoModelの状態をloadingに設定
      final container = ProviderContainer();
      final locateNotifier = container.read(localeNotifierProvider.notifier);
      locateNotifier.update(const Locale('en'));
      final locate = container.read(appLocalizationsProvider);
      expect(locate.hintText, "Please enter a repository name");
      expect(locate.cases, "cases");
      expect(locate.stars, "stars");
      expect(locate.forks, "forks");
      expect(locate.help_wanted_issues, "help wanted issues");
      expect(locate.updated, "updated");
      expect(locate.searching, "searching.....");
      expect(locate.error, "an error has occurred.");
      expect(locate.noHit, "no hit repositories found");
    });
  });
}
