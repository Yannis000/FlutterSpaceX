import 'package:json_annotation/json_annotation.dart';

part 'launchpad.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Launchpad{
  String? id;
  String? name;
  double? latitude;
  double? longitude;

  Launchpad(
      {this.id,
        this.name,
        this.latitude,
        this.longitude
      });


  factory Launchpad.fromJson(Map<String, dynamic> json) => _$LaunchpadFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchpadToJson(this);

}