import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/l10n/applocalizatons_provider.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/domain/types/sort_enum.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
import 'package:tuple/tuple.dart';

class CustomDropdown extends ConsumerWidget {
  final ScrollController scrollController;

  const CustomDropdown({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sort = ref.watch(sortNotifierProvider);
    final locate = ref.watch(appLocalizationsProvider);
    final items = [
      DropdownMenuItem(
        value: Sort.stars,
        child: Text(
          locate.stars,
          style: CustomText.titleM,
        ),
      ),
      DropdownMenuItem(
        value: Sort.forks,
        child: Text(
          locate.forks,
          style: CustomText.titleM,
        ),
      ),
      DropdownMenuItem(
        value: Sort.helpWantedIssues,
        child: Text(
          locate.help_wanted_issues,
          style: CustomText.titleM,
        ),
      ),
      DropdownMenuItem(
        value: Sort.updated,
        child: Text(
          locate.updated,
          style: CustomText.titleM,
        ),
      )
    ];

    return DropdownButton<Sort>(
      value: sort,
      items: items,
      onChanged: (value) {
        final usecase =
            ref.read(sortProvider(Tuple2(value!, scrollController)));
        usecase.sort();
      },
      isDense: false,
      borderRadius: BorderRadius.circular(20.0),
      underline: const SizedBox(),
    );
  }
}
