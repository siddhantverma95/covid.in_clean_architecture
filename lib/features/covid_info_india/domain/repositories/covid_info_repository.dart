import 'package:covid_in/core/error/failures.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/district_case.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/district_zone.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/total_case.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/total_case_history.dart';
import 'package:dartz/dartz.dart';

abstract class CovidInfoRepository{
  Future<Either<Failure, DistrictZone>> getDistrictZoneCovidInfo();
  Future<Either<Failure, DistrictCase>> getDistrictCaseCovidInfo();
  Future<Either<Failure, TotalCase>> getTotalCaseCovidInfo();
  Future<Either<Failure, TotalCaseHistory>> getTotalCaseHistoryCovidInfo();
}