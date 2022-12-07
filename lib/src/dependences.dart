import 'package:api_dio/src/feature/dashboard/controller/dashborder.controller.dart';
import 'package:api_dio/src/feature/dashboard/models/pokemon.model.dart';
import 'package:api_dio/src/feature/dashboard/repository/dashboard.repository.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.I;
void registerDependences() {
  di.registerLazySingleton<DashboardRepository>(() => DashboardRepository());
  di.registerLazySingleton<DashboardController>(
      () => DashboardController(repository: di.get()));
}
