import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecases.dart';
import 'package:search_repo/application/state/scroll_controller.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/application/types/sort_enum.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
import 'package:tuple/tuple.dart';

class CustomDropdown extends ConsumerWidget {
  const CustomDropdown({
    super.key,
  });

  @visibleForTesting
  static final dropDown = UniqueKey();
  @visibleForTesting
  static final stars = UniqueKey();
  @visibleForTesting
  static final forks = UniqueKey();
  @visibleForTesting
  static final help = UniqueKey();
  @visibleForTesting
  static final update = UniqueKey();
  @visibleForTesting
  static final empty = UniqueKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sort = ref.watch(sortNotifierProvider);
    final scrollController = ref.watch(scrollProvider);
    final l10n = AppLocalizations.of(context)!;
    final items = [
      DropdownMenuItem(
        key: stars,
        value: Sort.stars,
        child: Text(
          l10n.stars,
          style: CustomText.titleM,
        ),
      ),
      DropdownMenuItem(
        key: forks,
        value: Sort.forks,
        child: Text(
          l10n.forks,
          style: CustomText.titleM,
        ),
      ),
      DropdownMenuItem(
        key: help,
        value: Sort.helpWantedIssues,
        child: Text(
          l10n.help_wanted_issues,
          style: CustomText.titleM,
        ),
      ),
      DropdownMenuItem(
        key: update,
        value: Sort.updated,
        child: Text(
          l10n.updated,
          style: CustomText.titleM,
        ),
      ),
      DropdownMenuItem(
        key: empty,
        value: Sort.empty,
        child: Text(
          l10n.empty,
          style: CustomText.titleM,
        ),
      ),
    ];

    return DropdownButton<Sort>(
      key: dropDown,
      value: sort,
      items: items,
      onChanged: (value) async {
        final usecase =
            ref.read(sortProvider(Tuple2(value!, scrollController)));
        await usecase.sort();
      },
      borderRadius: BorderRadius.circular(20.0),
      underline: const SizedBox(),
      padding: const EdgeInsets.fromLTRB(30.0, 0, 0, 0),
    );
  }
}
