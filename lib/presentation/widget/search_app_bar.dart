import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecases.dart';
import 'package:search_repo/application/state/l10n/applocalizatons_provider.dart';
import 'package:search_repo/presentation/theme/fonts.dart';

class SearchAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

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
    final locate = ref.watch(appLocalizationsProvider);
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
                  onPressed: () {
                    textController.clear();
                  },
                ),
                prefixIcon: const Icon(
                  Icons.search,
                ),
                hintText: locate.hintText,
              ),
              onFieldSubmitted: (searchText) async {
                //Tuple2を使用して、ProviderFamilyで引数を2つ受け取ることが可能に。
                final usecase = ref.watch(
                  searchProvider(searchText),
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
