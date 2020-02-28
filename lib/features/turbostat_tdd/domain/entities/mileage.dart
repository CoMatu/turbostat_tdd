import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
part 'mileage.g.dart';

@JsonSerializable()
class Mileage extends Equatable {
  final DateTime mileageDateTime;
  final int mileage;

  Mileage({
    @required this.mileageDateTime,
    @required this.mileage,
  });

  @override
  List<Object> get props => [mileageDateTime, mileage];

  factory Mileage.fromJson(Map<String, dynamic> json) => _$MileageFromJson(json);
  Map<String, dynamic> toJson() => _$MileageToJson(this);
}
