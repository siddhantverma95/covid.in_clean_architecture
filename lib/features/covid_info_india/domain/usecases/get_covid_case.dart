import 'package:covid_in/core/error/failures.dart';
import 'package:covid_in/core/usecases/usecase.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/district_case.dart';
import 'package:covid_in/features/covid_info_india/domain/repositories/covid_info_repository.dart';
import 'package:dartz/dartz.dart';

class GetCovidCase implements UseCase<DistrictCase, NoParams>{
  final CovidInfoRepository repository;

  GetCovidCase(this.repository);

  @override
  Future<Either<Failure, DistrictCase>> call(params) async {
    return await repository.getDistrictCaseCovidInfo();
  }
}