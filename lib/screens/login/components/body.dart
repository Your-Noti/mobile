import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notification/helpers/user_profile.dart';
import 'package:notification/constants/styles.dart';
import 'package:notification/screens/dashboard/dashboard_screen.dart';

Future signInWithGoogle() async {
  await cleanUserProfile();
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  await FirebaseAuth.instance.signInWithCredential(credential);

  setUser(googleUser!.id, googleAuth?.accessToken, googleAuth?.idToken,
      googleUser.email);
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/socialMedia/google.svg', width: 36),
              Text('Login wiht Google'),
              Container(
                child: null,
                width: 36,
              )
            ],
          ),
          style: ElevatedButton.styleFrom(
              minimumSize: Size(width * 0.8, buttonHeight),
              maximumSize: Size(width * 0.8, buttonHeight),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ))),
    );
  }
}
