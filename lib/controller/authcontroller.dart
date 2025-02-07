import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:furitshop/core/services/services_setting.dart';
import 'package:furitshop/views/screens/Home/homepage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authcontroller extends GetxController {
  ServicesSetting c = Get.find();
  // facebook login state state object
  signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.accessToken == null) {
      return;
    }
    // Create a credential from the access token
    // ignore: unused_local_variable
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    c.logging();
    c.getUserInfo();
    //await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    return Get.off(() => Homepage());
  }

  // google_sign_in
  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    c.logging();
    c.getUserInfo();
    return Get.offNamed('/home');
  }
}
