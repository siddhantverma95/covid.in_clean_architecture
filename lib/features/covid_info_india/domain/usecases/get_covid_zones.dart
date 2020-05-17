import 'package:covid_in/core/error/failures.dart';
import 'package:covid_in/core/usecases/usecase.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/district_zone.dart';
import 'package:covid_in/features/covid_info_india/domain/repositories/covid_info_repository.dart';
import 'package:dartz/dartz.dart';

class GetCovidZone implements UseCase<DistrictZone, NoParams>{
  final CovidInfoRepository repository;

  GetCovidZone(this.repository);

  @override
  Future<Either<Failure, DistrictZone>> call(params) async {
    return await repository.getDistrictZoneCovidInfo();
  }
}