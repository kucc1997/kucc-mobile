import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:kucc_mobile_data/models/json_map.dart';
import 'package:kucc_mobile_data/models/speaker_model.dart';

part 'events_model.g.dart';

@immutable
@JsonSerializable()
class EventModel extends Equatable {
  const EventModel({
    this.banner,
    required this.description,
    this.endDate,
    required this.startDate,
    required this.label,
    this.speakers,
    required this.title,
    required this.type,
  });

  final String? banner;
  final String description;
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  final List<String> label;
  final List<SpeakerModel>? speakers;
  final String title;
  final String type;

  @override
  List<Object?> get props => [
        banner,
        description,
        endDate,
        startDate,
        label,
        title,
        type,
        speakers,
      ];

  static EventModel fromJson(JsonMap json) => _$EventModelFromJson(json);

  JsonMap toJson() => _$EventModelToJson(this);

  EventModel copyWith({
    String? banner,
    String? description,
    DateTime? endDate,
    DateTime? startDate,
    List<String>? label,
    List<SpeakerModel>? speakers,
    String? title,
    String? type,
  }) {
    return EventModel(
      banner: banner ?? this.banner,
      description: description ?? this.description,
      endDate: endDate ?? this.endDate,
      startDate: startDate ?? this.startDate,
      label: label ?? this.label,
      speakers: speakers ?? this.speakers,
      title: title ?? this.title,
      type: type ?? this.type,
    );
  }

  @override
  String toString() {
    return 'EventModel(banner: $banner, description: $description, endDate: $endDate, startDate: $startDate, label: $label, speakers: $speakers, title: $title, type: $type)';
  }
}
