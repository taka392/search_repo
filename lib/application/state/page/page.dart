import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'page.g.dart';

@Riverpod(keepAlive: true)
class PageNotifier extends _$PageNotifier {
  @override
  int build(){
    return  1;
  }

}