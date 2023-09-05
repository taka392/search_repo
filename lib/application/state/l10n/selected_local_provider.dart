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