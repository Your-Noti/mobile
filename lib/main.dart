import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import './app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: [Locale('en', 'US')],
    path: 'resources/langs',
    fallbackLocale: Locale('en', 'US'),
    useFallbackTranslations: true,
    useOnlyLangCode: true,
    child: MyApp(),
  ));
}
