import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthHelper {
  /// Handle Google Signin to authenticate user
  Future<GoogleSignInAccount?> googleSignInProcess() async {
    final GoogleSignIn _googleSignIn;

    if (Platform.isAndroid) {
      _googleSignIn = GoogleSignIn();
    } else {
      _googleSignIn = GoogleSignIn(
          clientId:
              "912173153696-ckptv6q9sffcgcs5jk7390tkfo26avc5.apps.googleusercontent.com");
    }

    // GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      return googleUser;
    }
    return null;
  }

  /// To Check if the user is already signedin through google
  alreadySignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    bool alreadySignIn = await _googleSignIn.isSignedIn();
    return alreadySignIn;
  }

  /// To signout from the application if the user is signed in through google
  Future<GoogleSignInAccount?> googleSignOutProcess() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await _googleSignIn.signOut();

    return googleUser;
  }
}
