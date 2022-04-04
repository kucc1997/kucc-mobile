import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationFirebaseData {
  AuthenticationFirebaseData(this._auth, this._googleSignIn);
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await _auth.signInWithCredential(credential);
  }

  Stream<bool> authStatus() {
    return _auth.authStateChanges().asyncMap<bool>((event) => event != null);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? getLoggedInUser() {
    return _auth.currentUser;
  }
}
