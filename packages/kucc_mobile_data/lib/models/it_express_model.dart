import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'package:kucc_mobile_data/models/json_map.dart';

part 'it_express_model.g.dart';

@immutable
@JsonSerializable()
class ITExpressModel extends Equatable {
  final String title;
  @JsonKey(name: 'url')
  final Uri pdf;
  final String year;
  final String? cover;
  const ITExpressModel({
    required this.title,
    required this.pdf,
    required this.year,
    this.cover,
  });

  @override
  List<Object?> get props => [title, pdf, year, cover];

  @override
  String toString() {
    return 'ITExpressModel(title: $title, pdf: $pdf, year: $year, cover: $cover)';
  }

  static ITExpressModel fromJson(JsonMap json) =>
      _$ITExpressModelFromJson(json);

  JsonMap toJson() => _$ITExpressModelToJson(this);

  ITExpressModel copyWith({
    String? title,
    Uri? pdf,
    String? year,
    String? cover,
  }) {
    return ITExpressModel(
      title: title ?? this.title,
      pdf: pdf ?? this.pdf,
      year: year ?? this.year,
      cover: cover ?? this.cover,
    );
  }
}
