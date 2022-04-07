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

  static const Map<String,dynamic> ru = {
  "askNotification": "Нам нужно разрешение на отправку вам уведомлений при получении оповещения. Разрешите доступ для правильной работы Noti.",
  "loginGoogle": "Зайти через Google",
  "subscriptionsTitle": "Подписки",
  "subscriptionsSubTitle": "Set subscriptions on this list to initiate notifications."
};
static const Map<String,dynamic> uk = {
  "askNotification": "Нам нужно разрешение на отправку вам уведомлений при получении оповещения. Разрешите доступ для правильной работы Noti.",
  "loginGoogle": "Зайти через Google",
  "subscriptionsTitle": "Підписки",
  "subscriptionsSubTitle": "Set subscriptions on thissubscriptionsSubTitle list to initiate notifications."
};
static const Map<String,dynamic> en_US = {
  "askNotification": "We need permission to send you notifications when an alert is received. Please allow access for Noti to work correctly.",
  "loginGoogle": "Login with Google",
  "subscriptionsTitle": "Subscriptions",
  "subscriptionsSubTitle": "Set subscriptions on this list to initiate notifications.",
  "sales": "Sales"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "uk": uk, "en_US": en_US};
}
