import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:tuple/tuple.dart';

class SearchAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  final ScrollController scrollController;
  const SearchAppBar( {Key? key,required this.scrollController}) : super(key: key);
//
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final textController = useTextEditingController();
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(36.0),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 19,
            bottom: 10,
          ),
          child: SizedBox(
            width: 343,
            height: 36,
            child: TextFormField(
                controller: textController,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.clear,
                      ),
                      onPressed: () {
                        textController.clear();
                      }
                  ),
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
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