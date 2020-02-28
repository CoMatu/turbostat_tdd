// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mileage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mileage _$MileageFromJson(Map<String, dynamic> json) {
  return Mileage(
    mileageDateTime: json['mileageDateTime'] == null
        ? null
        : DateTime.parse(json['mileageDateTime'] as String),
    mileage: json['mileage'] as int,
  );
}

Map<String, dynamic> _$MileageToJson(Mileage instance) => <String, dynamic>{
      'mileageDateTime': instance.mileageDateTime?.toIso8601String(),
      'mileage': instance.mileage,
    };
