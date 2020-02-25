import 'package:meta/meta.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class AddCarMileage {
  final TurbostatRepository repository;

  AddCarMileage({@required this.repository});

  Future<void> addCarMileage(String carId, int mileage) async {
    await repository.addCarMileage(carId, mileage);
  }
}
