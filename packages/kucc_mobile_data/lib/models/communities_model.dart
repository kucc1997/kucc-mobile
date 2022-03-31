import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kucc_mobile_data/models/json_map.dart';
import 'package:meta/meta.dart';

part 'communities_model.g.dart';

@immutable
@JsonSerializable()
class CommunityModel extends Equatable {
  final String about;
  final String image;
  final String name;
  final List<Map<String, dynamic>> coordinators;

  const CommunityModel({
    required this.about,
    required this.image,
    required this.name,
    required this.coordinators,
  });

  @override
  List<Object?> get props => [name, about, coordinators, image];

  @override
  String toString() {
    return 'CommunityModel(about: $about, image: $image, name: $name, coordinators: $coordinators)';
  }

  CommunityModel copyWith({
    String? about,
    String? image,
    String? name,
    List<Map<String, dynamic>>? coordinators,
  }) {
    return CommunityModel(
      about: about ?? this.about,
      image: image ?? this.image,
      name: name ?? this.name,
      coordinators: coordinators ?? this.coordinators,
    );
  }

  static CommunityModel fromJson(JsonMap json) =>
      _$CommunityModelFromJson(json);

  JsonMap tojson() => _$CommunityModelToJson(this);
}
