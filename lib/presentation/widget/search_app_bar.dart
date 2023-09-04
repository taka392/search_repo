import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
import 'package:tuple/tuple.dart';

class SearchAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  final ScrollController scrollController;
  const SearchAppBar( {Key? key,required this.scrollController}) : super(key: key);
//
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final textController = useTextEditingController();
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
              width: 343,
              height: 36,
              child: TextFormField(
                  controller: textController,
                  style: CustomText.bodyM,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.clear,
                        ),
                        onPressed: () {
                          textController.clear();
                        }
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    hintText: 'Enter your username',
                  ),
                  onFieldSubmitted: (searchText)async{
                    final usecase = ref.watch(searchProvider(Tuple2(searchText, scrollController)));
                    await usecase.search();
                  }
              ),
            ),
        ),
        ),
    );
  }
}