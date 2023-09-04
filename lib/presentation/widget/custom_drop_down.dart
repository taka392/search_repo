
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/sort/sort.dart';
import 'package:search_repo/domain/types/sort_enum.dart';

class CustomDropdown extends ConsumerWidget {
  const CustomDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sort = ref.watch(sortNotifierProvider);
    const items = [
      DropdownMenuItem(
        value: Sort.stars,
        child: Text('stars'),
      ),
      DropdownMenuItem(
        value: Sort.forks,
        child: Text('forks'),
      ),
      DropdownMenuItem(
        value: Sort.helpWantedIssues,
        child: Text('help-wanted-issues'),
      ),
      DropdownMenuItem(
        value: Sort.updated,
        child: Text('updated'),
      ),
    ];

    return DropdownButton<Sort>(
      value: Sort.stars,
      items: items,
      onChanged: (value) {
        final usecase = ref.read(sortProvider(value);
        usecase.sort();
      },
      focusColor: Colors.transparent,
    );
  }
}