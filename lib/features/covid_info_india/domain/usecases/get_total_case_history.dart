import 'package:covid_in/core/error/failures.dart';
import 'package:covid_in/core/usecases/usecase.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/total_case_history.dart';
import 'package:covid_in/features/covid_info_india/domain/repositories/covid_info_repository.dart';
import 'package:dartz/dartz.dart';

class GetTotalCaseHistory implements UseCase<TotalCaseHistory, NoParams>{
  final CovidInfoRepository repository;

  GetTotalCaseHistory(this.repository);

  @override
  Future<Either<Failure, TotalCaseHistory>> call(params) async {
    return await repository.getTotalCaseHistoryCovidInfo();
  }
}