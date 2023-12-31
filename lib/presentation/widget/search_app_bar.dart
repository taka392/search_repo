import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecases.dart';
import 'package:search_repo/application/state/scroll_controller.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
import 'package:tuple/tuple.dart';

class SearchAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
  });

  @visibleForTesting
  static final textFormField = UniqueKey();
  @visibleForTesting
  static final clear = UniqueKey();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //画面の横幅の値を取得
    final double screenWidth = MediaQuery.of(context).size.width * 0.9;
    final textController = useTextEditingController();
    final scrollController = ref.watch(scrollProvider);
    final l10n = AppLocalizations.of(context)!;
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: screenWidth,
            height: 36,
            child: TextFormField(
              key: textFormField,
              controller: textController,
              style: CustomText.titleM,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  key: clear,
                  icon: const Icon(
                    Icons.clear,
                  ),
                  onPressed: () async {
                    textController.clear();
                    final usecase = ref.read(refreshProvider);
                    await usecase.refresh();
                  },
                ),
                prefixIcon: const Icon(
                  Icons.search,
                ),
                hintText: l10n.hintText,
              ),
              onFieldSubmitted: (searchText) async {
                final usecase = ref.watch(
                  searchProvider(Tuple2(searchText, scrollController)),
                );
                await usecase.search();
              },
            ),
          ),
        ),
      ),
    );
  }
}
