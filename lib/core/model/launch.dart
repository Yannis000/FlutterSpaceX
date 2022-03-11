import 'package:json_annotation/json_annotation.dart';

import 'links.dart';

part 'launch.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Launch{
  String? name;
  String? dateUtc;
  int? dateUnix;
  String? dateLocal;
  bool? success;
  Links? links;

  Launch(
      {this.name,
      this.dateUtc,
      this.dateUnix,
      this.dateLocal,
      this.success,
      this.links});

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}