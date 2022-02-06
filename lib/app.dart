import 'package:flutter/material.dart';
import 'package:notification/screens/notificationPermission/notification_permission_screen.dart';
import 'package:notification/screens/dashboard/dashboard_screen.dart';
import 'package:notification/screens/login/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const supportedLocales = [
  Locale('en', ''),
  Locale('uk', ''),
  Locale('ru', ''),
];

const localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

class MyApp extends StatefulWidget {
  final bool isAskPermission;
  final bool isLogin;

  const MyApp({Key? key, required this.isAskPermission, required this.isLogin})
      : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en', '');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  Widget build(BuildContext context) {
    Widget page;

    if (!widget.isAskPermission) {
      page = const NotificationPermissionScreen();
    } else if (!widget.isLogin) {
      page = const LoginScreen();
    } else {
      page = const DashboardScreen();
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: supportedLocales,
        localizationsDelegates: localizationsDelegates,
        locale: _locale,
        home: page);
  }
}
