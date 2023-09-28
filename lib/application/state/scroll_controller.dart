import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scrollProvider = Provider.autoDispose<ScrollController>((ref) {
  return ScrollController();
});
