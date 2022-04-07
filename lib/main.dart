import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:notification/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'generated/codegen_loader.g.dart';

Future initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await initFirebase();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US')],
        path: 'resources/langs',
        fallbackLocale: Locale('en', 'US'),
        assetLoader: CodegenLoader(),
        child: MyApp(),
    )
  );
}
