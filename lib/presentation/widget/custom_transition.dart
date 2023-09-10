import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

///画面遷移のアニメーションを制御します。
CustomTransitionPage<T> buildTransitionPage<T>({
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
    //millisecondsを0にすることで、画面遷移のアニメーションを無効化
    transitionDuration: const Duration(milliseconds: 0),
  );
}
