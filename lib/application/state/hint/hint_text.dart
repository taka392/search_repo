import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'hint.g.dart';

@Riverpod(keepAlive: true)
class HintNotifier extends _$HintNotifier {
  @override
  String build(){
    return  "";
  }

  void update(String data){
    state =data;
  }

  void delete(){
    state= "";
  }
}