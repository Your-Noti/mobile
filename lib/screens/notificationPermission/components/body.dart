import 'package:flutter/material.dart';
import 'package:notification/constants/styles.dart';
import 'package:notification/helpers/permission.dart';
import 'package:notification/screens/dashboard/dashboard_screen.dart';
import 'package:notification/screens/login/login_screen.dart';
import 'package:notification/helpers/user_profile.dart';

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
                isLogin ? const LoginScreen() : const DashboardScreen()),
      );
    }

    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/logo/logoTransparent.png'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )),
        Expanded(
            flex: 1, // 60% of space => (6/(6 + 4))
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
