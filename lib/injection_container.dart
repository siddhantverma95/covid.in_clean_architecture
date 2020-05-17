import 'package:covid_in/core/custom_shared_pref.dart';
import 'package:covid_in/core/network/dio_config.dart';
import 'package:covid_in/core/network/http_request.dart';
import 'package:covid_in/features/covid_info_india/data/respositories/covid_info_repository_impl.dart';
import 'package:covid_in/features/covid_info_india/domain/repositories/covid_info_repository.dart';
import 'package:covid_in/features/covid_info_india/domain/usecases/get_covid_case.dart';
import 'package:covid_in/features/covid_info_india/domain/usecases/get_total_case.dart';
import 'package:covid_in/features/covid_info_india/presentation/bloc/district_case_zone_bloc.dart';
import 'package:covid_in/main.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/covid_info_india/data/datasources/covid_info_remote_and_fake_data_source.dart';
import 'features/covid_info_india/domain/usecases/get_covid_zones.dart';
import 'features/covid_info_india/domain/usecases/get_total_case_history.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // FEATURE - COVID_INFO_INDIA
  //bloc
  sl.registerFactory<DistrictCaseZoneBloc>(
    () => DistrictCaseZoneBloc(
      getCovidCase: sl(), getCovidZone: sl(), getTotalCase: sl(), getTotalCaseHistory: sl(),
      ));

  //use cases
  sl.registerLazySingleton(() => GetCovidCase(sl()));
  sl.registerLazySingleton(() => GetCovidZone(sl()));
  sl.registerLazySingleton(() => GetTotalCase(sl()));
  sl.registerLazySingleton(() => GetTotalCaseHistory(sl()));

  //Repository
  sl.registerLazySingleton<CovidInfoRepository>(
    () => CovidInfoRepositoryImpl(
      remoteDataSource: sl()));

  // //Data Source
  // sl.registerLazySingleton<CovidInfoRemoteDataSource>(
  //   () => CovidInfoRemoteDataSourceImpl(api: sl()));
  
  //External library
  sl.registerLazySingleton<DioConfig>(() => DioConfigImpl());
  sl.registerLazySingleton(() async => await SharedPreferences.getInstance());

  //Core
  sl.registerLazySingleton<DioHttpRequest>(() => DioHttpRequestImpl(sl()));
  sl.registerLazySingleton<CovidInfoApi>(() => USE_FAKE_API_IMPLEMENTATION ? CovidInfoFakeDataSource() :CovidInfoRemoteDataSource(sl()));
  sl.registerLazySingleton<CustomSharedPreferences>(() => CustomSharedPreferencesImpl(sl()));
}