import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Company{
  String name;
  String founder;
  int founded;
  int employees;
  String summary;


  Company(
      {required this.name,
      required this.founder,
      required this.founded,
      required this.employees,
      required this.summary});

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}