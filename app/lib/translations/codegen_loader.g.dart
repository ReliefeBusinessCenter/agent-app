// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> am = {
  "app_name": "የደላላ አፕ",
  "//comment//": "Welcomepage",
  "go_in_button_text": "ግባ"
};
static const Map<String,dynamic> en = {
  "app_name": "Broker app",
  "//comment//": "Welcomepage",
  "go_in_button_text": "Go In"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"am": am, "en": en};
}
