import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/part.dart';
import 'package:meta/meta.dart';

class PartModel extends Part {
  PartModel(
      {@required partId,
      @required partName,
      @required partCode,
      @required partPrice})
      : super(
        partId: partId,
        partName: partName,
        partCode: partCode,
        partPrice: partPrice,
      );

  factory PartModel.fromJson(Map<String, dynamic> json) {
    return PartModel(
      partId: json['partId'],
      partName: json['partName'],
      partCode: json['partCode'],
      partPrice: json['partPrice'],
    );
  }
}
