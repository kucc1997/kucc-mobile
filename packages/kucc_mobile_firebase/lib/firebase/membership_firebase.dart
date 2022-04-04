import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kucc_mobile_data/kucc_mobile_data.dart';

class MembershipFirebase implements MembershipData {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  MembershipFirebase(this._firebaseFirestore, this._firebaseStorage);

  @override
  Future<void> applyForMembership(
      String uid, MembershipModel membershipDetail) async {
    await _firebaseFirestore.collection('membership').doc(uid).set(
          membershipDetail.toJson(),
        );
  }

  @override
  Future<bool> checkMembershipStatus(String uid) async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection('membership').doc(uid).get();
    return snapshot.exists;
  }

  @override
  Future<MembershipModel> getMembershipDetail(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> result =
        await _firebaseFirestore.collection('membership').doc(uid).get();
    if (result.data() != null) {
      return MembershipModel.fromJson(result.data()!);
    } else {
      throw MembershipDoesNotExistError();
    }
  }

  @override
  Future<void> updateMembership(String mid, String txID, File document) async {
    try {
      UploadTask task =
          _firebaseStorage.ref('membership/$mid').putFile(document);

      await task.then((p0) async {
        await _firebaseFirestore.collection('membership').doc(mid).update({
          'transaction_id': txID,
          'document': p0.ref,
        });
      });
    } on FirebaseException {
      throw MembershipUpdateFailed();
    }
  }
}
