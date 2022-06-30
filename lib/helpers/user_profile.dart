import 'package:localstore/localstore.dart';
import 'package:mobile/constants/settings.dart';
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

Future cleanUserProfile() async =>
    {await db.collection(userProfile).doc(userID).delete()};

Future<bool> isUserLogin() async {
  try {
    final user = await getUser();

    final credential = GoogleAuthProvider.credential(
      accessToken: user?["accessToken"],
      idToken: user?["idToken"],
    );

    final isLogin =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return isLogin.user != null;
  } catch (err) {
    cleanUserProfile();
    return false;
  }
}
