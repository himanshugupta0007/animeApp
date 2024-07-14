import 'package:json_annotation/json_annotation.dart';

part 'start_date.g.dart';

@JsonSerializable()
class StartDate {
  StartDate(this.year, this.month, this.day);
  int? year;
  int? month;
  int? day;

  factory StartDate.fromJson(Map<String, dynamic> json) =>
      _$StartDateFromJson(json);

  Map<String, dynamic> toJson() => _$StartDateToJson(this);
}
