import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'json_map.dart';

part 'user_model.g.dart';

@immutable
@JsonSerializable()
class UserModel extends Equatable {
  const UserModel(
      {required this.batchOf,
      required this.email,
      required this.fullName,
      required this.isAlumni,
      required this.isKUStudent,
      required this.isMemeber,
      required this.profilePhoto});

  @JsonKey(name: 'batch_of')
  final String batchOf;
  final String email;
  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'is_alumni')
  final bool isAlumni;
  @JsonKey(name: 'is_ku_student')
  final bool isKUStudent;
  @JsonKey(name: 'is_member')
  final bool isMemeber;
  @JsonKey(name: 'profile_photo')
  final String profilePhoto;

  static UserModel fromJson(JsonMap json) => _$UserModelFromJson(json);

  JsonMap toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [email];

  UserModel copyWith({
    String? batchOf,
    String? email,
    String? fullName,
    bool? isAlumni,
    bool? isKUStudent,
    bool? isMemeber,
    String? profilePhoto,
  }) {
    return UserModel(
      batchOf: batchOf ?? this.batchOf,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      isAlumni: isAlumni ?? this.isAlumni,
      isKUStudent: isKUStudent ?? this.isKUStudent,
      isMemeber: isMemeber ?? this.isMemeber,
      profilePhoto: profilePhoto ?? this.profilePhoto,
    );
  }

  @override
  String toString() {
    return 'UserModel(batchOf: $batchOf, email: $email, fullName: $fullName, isAlumni: $isAlumni, isKUStudent: $isKUStudent, isMemeber: $isMemeber, profilePhoto: $profilePhoto)';
  }
}
