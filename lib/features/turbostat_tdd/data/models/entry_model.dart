import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/entry.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entry_model.g.dart';

@JsonSerializable(explicitToJson: true)

class EntryModel extends Entry {
  EntryModel({
    @required String entryId,
    @required String maintenanceId,
    @required String entryNote,
    @required DateTime entryDateTime,
    @required double entryWorkPrice,
    @required int entryMileage,
  }) : super(
          entryId: entryId,
          maintenanceId: maintenanceId,
          entryNote: entryNote,
          entryDateTime: entryDateTime,
          entryWorkPrice: entryWorkPrice,
          entryMileage: entryMileage,
        );

  factory EntryModel.fromJson(Map<String, dynamic> json) => _$EntryModelFromJson(json);

  Map<String, dynamic> toJson() => _$EntryModelToJson(this);

}
