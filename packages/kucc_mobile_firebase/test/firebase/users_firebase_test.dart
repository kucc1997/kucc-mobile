// TODO : Add Tests

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kucc_mobile_data/kucc_mobile_data.dart';
import 'package:kucc_mobile_firebase/kucc_mobile_firebase.dart';

void main() {
  FakeFirebaseFirestore _firebaseFirestore;
  MockFirebaseStorage _firebaseStorage;
  late UsersFirebase _userFirebase;

  const UserModel _userModeltoFetchandget = UserModel(
      batchOf: '2019',
      email: 'email@rmail.com',
      fullName: 'fullName',
      isAlumni: false,
      isKUStudent: true,
      isMemeber: true,
      profilePhoto: 'profilePhoto');

  group('Test User Firebase', () {
    setUp(() {
      _firebaseStorage = MockFirebaseStorage();
      _firebaseFirestore = FakeFirebaseFirestore();
      _userFirebase = UsersFirebase(_firebaseFirestore, _firebaseStorage);
    });

    test('Test user data', () {});
  });
}
