import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:search_repo/application/state/l10n/selected_local_provider.dart';

final appLocalizationsProvider = StateProvider<AppLocalizations>((ref) {
  final selectedLocale = ref.watch(selectedLocaleProvider);
  return lookupAppLocalizations(selectedLocale);
});
