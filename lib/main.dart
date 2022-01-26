import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:notification/helpers/permission.dart';
import 'package:notification/screens/notificationPermission/notification_permission_screen.dart';
import 'package:notification/screens/dashboard/dashboard_screen.dart';
import 'package:notification/screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notification/helpers/user_profile.dart';

Future initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  bool isAskPermission = await isAskNotificationPermission();
  bool isLogin = await isUserLogin();

  runApp(MyApp(isAskPermission: isAskPermission, isLogin: isLogin));
}

class MyApp extends StatelessWidget {
  final bool isAskPermission;
  final bool isLogin;

  const MyApp({Key? key, required this.isAskPermission, required this.isLogin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget page;

    if (!isAskPermission) {
      page = const NotificationPermissionScreen();
    } else if (!isLogin) {
      page = const LoginScreen();
    } else {
      page = const DashboardScreen();
    }

    return MaterialApp(debugShowCheckedModeBanner: false, home: page);
  }
}
