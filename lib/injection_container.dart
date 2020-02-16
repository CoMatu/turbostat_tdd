import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbostat_tdd/core/mode/mode_info.dart';
import 'package:turbostat_tdd/core/network/network_info.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/local_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/repositories/turbostat_repository_impl.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/add_car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/add_entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/add_entry_parts.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/add_maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/add_part_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/delete_car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/delete_entry.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/delete_maintenance.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/delete_part_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_car_models.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_entries.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_maintenances.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_part_models.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_concrete_car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_concrete_maintenance.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_entries.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_entry_parts.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Turbostat
  //Bloc
  sl.registerFactory(() => LoadDataBloc(
        repository: sl(),
        concrete: sl.call(),
        allCarModels: sl.call(),
        addCar: sl.call(),
        deleteCar: sl.call(),
      ));

  // Usecases
  sl.registerLazySingleton(() => GetAllCarModels(repository: sl()));
  sl.registerLazySingleton(() => GetConcreteCarModel(repository: sl()));
  sl.registerLazySingleton(() => AddCarModel(repository: sl()));
  sl.registerLazySingleton(() => DeleteCarModel(repository: sl()));
  sl.registerLazySingleton(() => AddMaintenanceModel(repository: sl()));
  sl.registerLazySingleton(() => GetAllMaintenances(repository: sl()));
  sl.registerLazySingleton(() => DeleteMaintenance(repository: sl()));
  sl.registerLazySingleton(() => GetConcreteMaintenance(repository: sl()));
  sl.registerLazySingleton(() => AddEntryModel(repository: sl()));
  sl.registerLazySingleton(() => GetEntries(repository: sl()));
  sl.registerLazySingleton(() => GetAllEntries(repository: sl()));
  sl.registerLazySingleton(() => DeleteEntry(repository: sl()));
  sl.registerLazySingleton(() => AddPartModel(repository: sl()));
  sl.registerLazySingleton(() => DeletePartModel(repository: sl()));
  sl.registerLazySingleton(() => GetAllPartModels(repository: sl()));
  sl.registerLazySingleton(() => AddEntryParts(repository: sl()));
  sl.registerLazySingleton(() => GetEntryParts(repository: sl()));

  // Repository
  sl.registerLazySingleton<TurbostatRepository>(() => TurbostatRepositoryImpl(
        networkInfo: sl(),
        modeInfo: sl(),
        localDataSource: sl(),
        //    remoteDataSource: sl(),
      ));

  // Data sources
//  sl.registerLazySingleton<TurbostatRemoteDataSource>(
//      () => TurbostatRemoteDataSourceImpl(collectionReference: sl()));
  sl.registerLazySingleton<TurbostatLocalDataSource>(
      () => TurbostatLocalDataSourceImpl());

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<ModeInfo>(() => ModeInfoImpl());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => DataConnectionChecker());
//  final collectionReference = Firestore.instance.collection('users');
//  sl.registerLazySingleton(() => collectionReference);
}
