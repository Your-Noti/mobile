import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:notification/helpers/permission.dart';
import 'package:notification/helpers/user_profile.dart';
import 'package:notification/app.dart';

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
