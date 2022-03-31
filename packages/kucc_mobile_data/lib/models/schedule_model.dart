import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kucc_mobile_data/models/json_map.dart';
import 'package:meta/meta.dart';

part 'schedule_model.g.dart';

@immutable
@JsonSerializable()
class ScheduleModel extends Equatable {
  final String description;
  @JsonKey(name: 'end_time')
  final DateTime endTime;
  final String event;
  @JsonKey(name: 'start_time')
  final DateTime startTime;
  final String title;
  const ScheduleModel({
    required this.description,
    required this.endTime,
    required this.event,
    required this.startTime,
    required this.title,
  });

  @override
  List<Object?> get props => [];

  ScheduleModel copyWith({
    String? description,
    DateTime? endTime,
    String? event,
    DateTime? startTime,
    String? title,
  }) {
    return ScheduleModel(
      description: description ?? this.description,
      endTime: endTime ?? this.endTime,
      event: event ?? this.event,
      startTime: startTime ?? this.startTime,
      title: title ?? this.title,
    );
  }

  @override
  String toString() {
    return 'ScheduleModel(description: $description, endTime: $endTime, event: $event, startTime: $startTime, title: $title)';
  }

  static ScheduleModel fromJson(JsonMap json) => _$ScheduleModelFromJson(json);
  JsonMap toJson() => _$ScheduleModelToJson(this);
}
