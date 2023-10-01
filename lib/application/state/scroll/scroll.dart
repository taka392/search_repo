import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll.g.dart';

@Riverpod(keepAlive: true)
class ScrollNotifier extends _$ScrollNotifier {
  @override
  ScrollController build() {
    return ScrollController();
  }
}
