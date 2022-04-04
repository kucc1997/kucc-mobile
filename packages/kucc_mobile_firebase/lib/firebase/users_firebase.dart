import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kucc_mobile_data/kucc_mobile_data.dart';

class UsersFirebase implements UserData {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  const UsersFirebase(this._firebaseFirestore, this._firebaseStorage);

  @override
  Future<UserModel> getUserData(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> result =
        await _firebaseFirestore.collection('users').doc(uid).get();
    if (result.data() != null) {
      return UserModel.fromJson(result.data()!);
    } else {
      throw UserDataFetchError();
    }
  }

  @override
  Stream<double> updateProfilePhoto(File file, String uid) {
    return _firebaseStorage
        .ref('users/profilephotos/$uid/')
        .putFile(file)
        .asStream()
        .asyncMap(
          (event) => (event.bytesTransferred / event.totalBytes) * 100,
        );
  }

  @override
  Future<void> setUserData(String uid, UserModel model) async {
    await _firebaseFirestore.collection('users').doc(uid).set(model.toJson());
  }
}
