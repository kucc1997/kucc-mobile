import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kucc_mobile_data/models/json_map.dart';
import 'package:meta/meta.dart';

part 'membership_model.g.dart';

@immutable
@JsonSerializable()
class MembershipModel extends Equatable {
  @JsonKey(name: 'changed_date')
  final DateTime changedDate;
  final String document;
  @JsonKey(name: 'new_membership')
  final bool newMembership;
  @JsonKey(name: 'requested_date')
  final DateTime requestedDate;
  final String status;
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  final String user;
  @JsonKey(name: 'user_email')
  final String userEmail;
  const MembershipModel({
    required this.changedDate,
    required this.document,
    required this.newMembership,
    required this.requestedDate,
    required this.status,
    required this.transactionId,
    required this.user,
    required this.userEmail,
  });

  @override
  List<Object?> get props => [];

  MembershipModel copyWith({
    DateTime? changedDate,
    String? document,
    bool? newMembership,
    DateTime? requestedDate,
    String? status,
    String? transactionId,
    String? user,
    String? userEmail,
  }) {
    return MembershipModel(
      changedDate: changedDate ?? this.changedDate,
      document: document ?? this.document,
      newMembership: newMembership ?? this.newMembership,
      requestedDate: requestedDate ?? this.requestedDate,
      status: status ?? this.status,
      transactionId: transactionId ?? this.transactionId,
      user: user ?? this.user,
      userEmail: userEmail ?? this.userEmail,
    );
  }

  @override
  String toString() {
    return 'MembershipModel(changedDate: $changedDate, document: $document, newMembership: $newMembership, requestedDate: $requestedDate, status: $status, transactionId: $transactionId, user: $user, userEmail: $userEmail)';
  }

  static MembershipModel fromJson(JsonMap json) =>
      _$MembershipModelFromJson(json);

  JsonMap toJson() => _$MembershipModelToJson(this);
}
