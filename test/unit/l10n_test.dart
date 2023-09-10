import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_repo/application/state/l10n/applocalizatons_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//
void main() {
  group('多言語変換テスト', () {
    test('英語への変換テスト', () async {
      //初期のlocateを英語に設定
      final initLocate = lookupAppLocalizations(const Locale('en'));
      final container = ProviderContainer(
        overrides: [appLocalizationsProvider.overrideWithValue(initLocate)],
      );
      final locate = container.read(appLocalizationsProvider);
      expect(locate.hintText, "Please enter a repository name");
      expect(locate.cases, "cases");
      expect(locate.stars, "stars");
      expect(locate.forks, "forks");
      expect(locate.empty, "best match");
      expect(locate.help_wanted_issues, "help wanted issues");
      expect(locate.updated, "updated");
      expect(locate.searching, "searching.....");
      expect(locate.error, "an error has occurred.");
      expect(locate.noHit, "no hit repositories found");
    });

    test('日本語への変換テスト', () async {
      //初期のlocateを英語に設定
      final initLocate = lookupAppLocalizations(const Locale('ja'));
      final container = ProviderContainer(
        overrides: [appLocalizationsProvider.overrideWithValue(initLocate)],
      );
      final locate = container.read(appLocalizationsProvider);
      expect(locate.hintText, "リポジトリ名を入力してください");
      expect(locate.cases, "件");
      expect(locate.stars, "スター");
      expect(locate.forks, "フォーク");
      expect(locate.empty, "ベストマッチ");
      expect(locate.help_wanted_issues, "Help wanted issues");
      expect(locate.updated, "更新日");
      expect(locate.searching, "検索中....");
      expect(locate.error, "エラーが発生しました");
      expect(locate.noHit, "ヒットするリポジトリが見つかりませんでした");
    });
  });
}
