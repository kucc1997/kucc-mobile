import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kucc_mobile_data/models/json_map.dart';
import 'package:meta/meta.dart';

part 'attendees_model.g.dart';

@immutable
@JsonSerializable()
class AttendeeModel extends Equatable {
  final String name;
  final String? certificate;
  final bool completed;
  const AttendeeModel({
    required this.name,
    this.certificate,
    required this.completed,
  });

  @override
  List<Object?> get props => [certificate, completed, name];

  AttendeeModel copyWith({
    String? certificate,
    bool? completed,
    String? name,
  }) {
    return AttendeeModel(
      certificate: certificate ?? this.certificate,
      completed: completed ?? this.completed,
      name: name ?? this.name,
    );
  }

  @override
  String toString() =>
      'Attendee(certificate: $certificate, completed: $completed, name: $name)';

  static AttendeeModel fromJson(JsonMap json) => _$AttendeeModelFromJson(json);

  JsonMap toJson() => _$AttendeeModelToJson(this);
}
