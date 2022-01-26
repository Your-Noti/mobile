import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notification/helpers/user_profile.dart';
import 'package:notification/screens/dashboard/dashboard_screen.dart';

Future signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth =
  await googleUser?.authentication;

  setUser(googleUser!.id, googleAuth?.accessToken, googleAuth?.idToken,
      googleUser.email);

  return googleAuth?.accessToken != null;
}


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future singIn() async {
      await signInWithGoogle();
      bool isLogin = await isUserLogin();

      if (isLogin) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      }
    }

    return Center(
      child: ElevatedButton(
        onPressed: singIn,
        child: Text("Notification Permission"),
      ),
    );
  }
}
