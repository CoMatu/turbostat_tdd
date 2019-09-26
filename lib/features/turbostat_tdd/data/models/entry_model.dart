import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/entry.dart';
import 'package:meta/meta.dart';

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

  factory EntryModel.fromJson(Map<String, dynamic> json) {
    return EntryModel(
      entryId: json['entryId'],
      maintenanceId: json['maintenanceId'],
      entryNote: json['entryNote'],
      entryDateTime: DateTime.parse(json['entryDateTime']),
      entryWorkPrice: json['entryWorkPrice'],
      entryMileage: json['entryMileage'],
    );
  }
}
