import 'package:flutter/material.dart';
import 'package:notification/constants/styles.dart';
import 'package:notification/helpers/permission.dart';
import 'package:notification/screens/dashboard/dashboard_screen.dart';
import 'package:notification/screens/login/login_screen.dart';
import 'package:notification/helpers/user_profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    void askPermission() async {
      await askNotificationPermission();

      bool isLogin = await isUserLogin();

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                isLogin ? const DashboardScreen() : const LoginScreen()),
      );
    }

    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo/logoTransparent.png'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Text(
                    AppLocalizations.of(context)!.askNotification,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )),
        Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: askPermission,
                child: Text("Notification Permission"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(width * 0.8, buttonHeight),
                ),
              ),
            )),
      ],
    );
  }
}
