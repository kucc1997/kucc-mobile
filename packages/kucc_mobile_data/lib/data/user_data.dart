import 'dart:io';

import 'package:kucc_mobile_data/kucc_mobile_data.dart';

abstract class UserDataError implements Exception {}

class ProfilePictureUpdateFailed extends UserDataError {}

class UserDataFetchError extends UserDataError {}

abstract class UserData {
  const UserData();

  Future<void> setUserData(String uid, UserModel model);

  Future<UserModel> getUserData(String uid);

  Stream<double> updateProfilePhoto(File file, String uid);
}
