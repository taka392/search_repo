import 'package:flutter/material.dart';
import 'package:search_repo/presentation/theme/size.dart';

/// フォント
class CustomFont {
  static const general = 'NotoSansJP';
}

/// 文字スタイル
class CustomText {
  static const titleMBold = TextStyle(
    fontSize: RawSize.p14,
    fontFamily: CustomFont.general,
    fontWeight: FontWeight.bold,
  );
  static const titleM = TextStyle(
    fontSize: RawSize.p14,
    fontFamily: CustomFont.general,
  );

  static const titleS = TextStyle(
    fontSize: RawSize.p12,
    fontFamily: CustomFont.general,
  );
}
