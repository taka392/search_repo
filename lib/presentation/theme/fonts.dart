import 'package:flutter/material.dart';
import 'package:search_repo/presentation/theme/size.dart';

/// フォント
class CustomFont {
  static const general = 'NotoSansJP';
}

/// 文字スタイル
class CustomText {
  static const titleL = TextStyle(
    fontSize: RawSize.p28,
    fontFamily: CustomFont.general,
    fontWeight: FontWeight.bold,
  );
  static const titleM = TextStyle(
    fontSize: RawSize.p24,
    fontFamily: CustomFont.general,
    fontWeight: FontWeight.bold,
  );
  static const titleS = TextStyle(
    fontSize: RawSize.p20,
    fontFamily: CustomFont.general,
  );
  static const bodyL = TextStyle(
    fontSize: RawSize.p18,
    fontFamily: CustomFont.general,
  );
  static const bodyM = TextStyle(
    fontSize: RawSize.p16,
    fontFamily: CustomFont.general,
  );
  static const bodyS = TextStyle(
    fontSize: RawSize.p16,
    fontFamily: CustomFont.general,
  );
}