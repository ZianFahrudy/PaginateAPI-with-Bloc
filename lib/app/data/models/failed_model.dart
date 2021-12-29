import 'package:json_annotation/json_annotation.dart';

part 'failed_model.g.dart';

@JsonSerializable(createToJson: false)
class Failed {
  Failed({
    required this.message,
  });
  final String message;

  factory Failed.fromJson(Map<String, dynamic> json) => _$FailedFromJson(json);
}
