import 'dart:io';

import 'package:kucc_mobile_data/kucc_mobile_data.dart';

abstract class MembershipError implements Exception {}

class MembershipUpdateFailed extends MembershipError {}

class MembershipApplicationFailed extends MembershipError {}

abstract class MembershipData {
  const MembershipData();

  Future<MembershipModel> getMembershipDetail(String uid);

  Future<bool> checkMembershipStatus(String uid);

  Future<void> applyForMembership(String uid, MembershipModel membershipDetail);

  Future<void> updateMembership(String mid, String txID, File document);
}
