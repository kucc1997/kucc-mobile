import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kucc_mobile_data/models/json_map.dart';
import 'package:meta/meta.dart';

part 'speaker_model.g.dart';

@immutable
@JsonSerializable()
class SpeakerModel extends Equatable {
  final String? designation;
  final String? photo;
  final String? topic;
  final String? name;
  const SpeakerModel({
    this.designation,
    this.photo,
    this.topic,
    this.name,
  });

  @override
  List<Object?> get props => [designation, photo, topic, name];

  static SpeakerModel fromJson(JsonMap json) => _$SpeakerModelFromJson(json);
  JsonMap toJson() => _$SpeakerModelToJson(this);

  SpeakerModel copyWith({
    String? designation,
    String? photo,
    String? topic,
    String? name,
  }) {
    return SpeakerModel(
      designation: designation ?? this.designation,
      photo: photo ?? this.photo,
      topic: topic ?? this.topic,
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return 'SpeakersModel(designation: $designation, photo: $photo, topic: $topic, name: $name)';
  }
}
