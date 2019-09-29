// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entry _$EntryFromJson(Map<String, dynamic> json) {
  return Entry(
    entryId: json['entryId'] as String,
    maintenanceId: json['maintenanceId'] as String,
    entryNote: json['entryNote'] as String,
    entryDateTime: json['entryDateTime'] == null
        ? null
        : DateTime.parse(json['entryDateTime'] as String),
    entryWorkPrice: (json['entryWorkPrice'] as num)?.toDouble(),
    entryMileage: json['entryMileage'] as int,
  );
}

Map<String, dynamic> _$EntryToJson(Entry instance) => <String, dynamic>{
      'entryId': instance.entryId,
      'maintenanceId': instance.maintenanceId,
      'entryNote': instance.entryNote,
      'entryDateTime': instance.entryDateTime?.toIso8601String(),
      'entryWorkPrice': instance.entryWorkPrice,
      'entryMileage': instance.entryMileage,
    };
