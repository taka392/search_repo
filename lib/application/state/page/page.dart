import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'page.g.dart';

@Riverpod(keepAlive: true)
class PageNotifier extends _$PageNotifier {
  @override
  int build(){
    return  1;
  }

  void update(){
    state =state+1;
  }

  void refresh(){
    state= 1;
  }
  void save(int page){
    state = page;
  }
}