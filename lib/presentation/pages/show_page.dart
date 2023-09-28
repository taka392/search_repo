import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repo/application/state/l10n/applocalizatons_provider.dart';
import 'package:search_repo/application/state/repo/repo_provider.dart';

class ShowPage extends ConsumerWidget {
  const ShowPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locate = ref.watch(appLocalizationsProvider);
    final repoData = ref.watch(watchRepoProvider);

    return Scaffold();
  }
}
