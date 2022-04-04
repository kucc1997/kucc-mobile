import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:kucc_mobile_firebase/kucc_mobile_firebase.dart';

void main() {
  late GoogleSignIn googleSignIn = MockGoogleSignIn();

  final user = MockUser(
    isAnonymous: false,
    uid: 'tgdufgishdisjfsjfijofjosjfosjfsfsdfs',
    email: 'ad11021319@student.ku.edu.np',
    displayName: 'Aadarsha Dhakal',
  );
  late FirebaseAuth firebaseAuthInstance = MockFirebaseAuth(mockUser: user);

  group('Before Login ', () {
    late AuthenticationFirebaseData authenticationFirebaseData =
        AuthenticationFirebaseData(firebaseAuthInstance, googleSignIn);

    test('currentUser should return null', () async {
      final currentUser = authenticationFirebaseData.getLoggedInUser();
      assert(currentUser == null);
    });
  });

  group('loginStatus Stream', () {
    late AuthenticationFirebaseData authenticationFirebaseData =
        AuthenticationFirebaseData(firebaseAuthInstance, googleSignIn);

    test(
        'Initially loggedInStatus should be false, after login true and after logout false',
        () async {
      final loggedInstatus = authenticationFirebaseData.authStatus();
      await authenticationFirebaseData.signInWithGoogle();
      await authenticationFirebaseData.signOut();
      expect(loggedInstatus, emitsInOrder([false, true, false]));
    });
  });

  group('After Login ', () {
    late UserCredential result;

    late AuthenticationFirebaseData authenticationFirebaseData =
        AuthenticationFirebaseData(firebaseAuthInstance, googleSignIn);

    setUp(() async {
      result = await authenticationFirebaseData.signInWithGoogle();
    });

    test('User should not be null', () async {
      assert(result.user != null);
      assert(result.user?.displayName == 'Aadarsha Dhakal');
    });

    test('currentUser should not return null', () async {
      final currentUser = authenticationFirebaseData.getLoggedInUser();
      assert(currentUser != null);
    });

    test('currentUser should return null after logout', () async {
      await authenticationFirebaseData.signOut();
      final currentUser = authenticationFirebaseData.getLoggedInUser();
      assert(currentUser == null);
    });
  });
}
