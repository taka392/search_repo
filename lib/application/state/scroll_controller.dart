import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scrollProvider = Provider<ScrollController>((ref) {
  return useScrollController();
});
