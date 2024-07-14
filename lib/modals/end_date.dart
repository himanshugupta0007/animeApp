import 'package:json_annotation/json_annotation.dart';

part 'end_date.g.dart';

@JsonSerializable()
class EndDate {
  EndDate(this.year, this.month, this.day);
  int? year;
  int? month;
  int? day;

  factory EndDate.fromJson(Map<String, dynamic> json) =>
      _$EndDateFromJson(json);

  Map<String, dynamic> toJson() => _$EndDateToJson(this);
}
