import 'dart:ui';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'locate.g.dart';
@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale build(){
    return const Locale('ja');
  }
  void update(Locale data){
    state = data;
  }
}