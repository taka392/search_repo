
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/domain/types/sort_enum.dart';

class CustomDropdown extends ConsumerWidget {
  const CustomDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return DropdownButton(
      value: Sort.updated,
      items: items,
      onChanged: (value) {
        // 選択が変更されたときに何かを行う
        // selectedValueはDropdownValue型として利用可能
      },
      focusColor: Colors.transparent,
    );
  }
}