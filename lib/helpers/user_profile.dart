import 'package:localstore/localstore.dart';
import 'package:notification/constants/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';

final db = Localstore.instance;

Future setUser(id, accessToken, idToken, email) async {
  await db.collection(userProfile).doc(userID).set({
    "id": id,
    "email": email,
    "accessToken": accessToken,
    "idToken": idToken,
  });
}

Future getUser() async => await db.collection(userProfile).doc(userID).get();

Future<bool> isUserLogin() async {
  final user = await getUser();
  String idToken = user?["idToken"];

  if (idToken.isEmpty) {
    return false;
  }

  final credential = GoogleAuthProvider.credential(
    accessToken: user?["accessToken"],
    idToken: user?["idToken"],
  );

  final isLogin = await FirebaseAuth.instance.signInWithCredential(credential);

  return isLogin.user != null;
}
