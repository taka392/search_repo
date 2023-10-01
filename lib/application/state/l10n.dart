import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appLocalizationsProvider =
    Provider.family<AppLocalizations, BuildContext>((ref, context) {
  return AppLocalizations.of(context)!;
});
