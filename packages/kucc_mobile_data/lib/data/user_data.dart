import 'dart:io';

import 'package:kucc_mobile_data/kucc_mobile_data.dart';

abstract class UserDataError implements Exception {}

class ProfilePictureUpdateFailed extends UserDataError {}

class UserDataFetchError extends UserDataError {}

abstract class UserData {
  const UserData();

  Future<UserModel> getUserData(String uid);

  Future<void> updateProfilePhoto(File file, String uid);
}
