import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Part extends Equatable {
  final String partId;
  final String partName;
  final String partCode;
  final int partPrice;

  Part({
    @required this.partId,
    @required this.partName,
    @required this.partCode,
    @required this.partPrice
    }) : super([
      partId,
      partName,
      partCode,
      partPrice
    ]);
}