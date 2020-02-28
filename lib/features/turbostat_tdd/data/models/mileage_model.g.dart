// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mileage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MileageModel _$MileageModelFromJson(Map<String, dynamic> json) {
  return MileageModel(
    mileageDateTime: json['mileageDateTime'],
    mileage: json['mileage'],
  );
}

Map<String, dynamic> _$MileageModelToJson(MileageModel instance) =>
    <String, dynamic>{
      'mileageDateTime': instance.mileageDateTime?.toIso8601String(),
      'mileage': instance.mileage,
    };
