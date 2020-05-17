import 'package:covid_in/core/error/failures.dart';
import 'package:covid_in/core/usecases/usecase.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/total_case.dart';
import 'package:covid_in/features/covid_info_india/domain/repositories/covid_info_repository.dart';
import 'package:dartz/dartz.dart';

class GetTotalCase implements UseCase<TotalCase, NoParams>{
  final CovidInfoRepository repository;

  GetTotalCase(this.repository);

  @override
  Future<Either<Failure, TotalCase>> call(params) async {
    return await repository.getTotalCaseCovidInfo();
  }
}