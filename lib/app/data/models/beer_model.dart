import 'package:json_annotation/json_annotation.dart';

part 'beer_model.g.dart';

@JsonSerializable(createToJson: false)
class BeerModel {
  BeerModel({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.imageUrl,
  });
  final int id;
  final String name;
  final String tagline;
  final String description;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  factory BeerModel.fromJson(Map<String, dynamic> json) =>
      _$BeerModelFromJson(json);
}
