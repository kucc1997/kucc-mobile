// TODO: Implement Membership Firestore

import 'dart:io';

import 'package:kucc_mobile_data/kucc_mobile_data.dart';

class MembershipFirebase implements MembershipData {
  @override
  Future<void> applyForMembership(
      String uid, MembershipModel membershipDetail) {
    // TODO: implement applyForMembership
    throw UnimplementedError();
  }

  @override
  Future<bool> checkMembershipStatus(String uid) {
    // TODO: implement checkMembershipStatus
    throw UnimplementedError();
  }

  @override
  Future<MembershipModel> getMembershipDetail(String uid) {
    // TODO: implement getMembershipDetail
    throw UnimplementedError();
  }

  @override
  Future<void> updateMembership(String mid, String txID, File document) {
    // TODO: implement updateMembership
    throw UnimplementedError();
  }
}
