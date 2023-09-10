import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repo/application/di/usecase_di.dart';
import 'package:search_repo/application/state/l10n/applocalizatons_provider.dart';
import 'package:search_repo/presentation/theme/fonts.dart';
import 'package:search_repo/presentation/theme/screen_pod.dart';
import 'package:tuple/tuple.dart';

class SearchAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  final ScrollController? scrollController;
  const SearchAppBar( {Key? key,this.scrollController}) : super(key: key);


  @visibleForTesting
  static final textFormField = UniqueKey();
  @visibleForTesting
  static final clear = UniqueKey();


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final textController = useTextEditingController();
    final locate = ref.watch(appLocalizationsProvider);
    double screenWidth = MediaQuery.of(context).size.width;


    final screen = ScreenRef(context).watch(screenProvider);

    double appBarWidth;
    if (screen.sizeClass == ScreenSizeClass.phone) {
      appBarWidth=(screenWidth*0.9);
    }else {
      appBarWidth=(screenWidth*0.8);
    }


    return AppBar(
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
              width: appBarWidth,
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
                        }
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    hintText: locate.hintText,
                  ),
                  onFieldSubmitted: (searchText)async{
                    final usecase = ref.watch(searchProvider(Tuple2(searchText, scrollController!)));
                    await usecase.search();
                  }
              ),
            ),
        ),
        ),
    );
  }
}