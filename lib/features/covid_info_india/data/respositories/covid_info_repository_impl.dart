import 'package:covid_in/core/error/exceptions.dart';
import 'package:covid_in/core/error/failures.dart';
import 'package:covid_in/features/covid_info_india/data/datasources/covid_info_remote_and_fake_data_source.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/district_case.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/district_zone.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/total_case.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/total_case_history.dart';
import 'package:covid_in/features/covid_info_india/domain/repositories/covid_info_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class CovidInfoRepositoryImpl implements CovidInfoRepository{
  final CovidInfoApi remoteDataSource;

  CovidInfoRepositoryImpl({
    @required this.remoteDataSource});
  @override
  Future<Either<Failure, DistrictCase>> getDistrictCaseCovidInfo() async {
    return await _getDistrictCase();
  }

  @override
  Future<Either<Failure, DistrictZone>> getDistrictZoneCovidInfo() async {
    return await _getDistrictZone();
  }

  @override
  Future<Either<Failure, TotalCase>> getTotalCaseCovidInfo() async {
    return await _getTotalCase();
  }

  Future<Either<Failure, DistrictCase>> _getDistrictCase() async{
    try{
      final remoteDistrictCase = await remoteDataSource.getDistrictCaseCovidInfo();
      return Right(remoteDistrictCase);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, DistrictZone>> _getDistrictZone() async{
    try{
      final remoteDistrictZone = await remoteDataSource.getDistrictZoneCovidInfo();
      return Right(remoteDistrictZone);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, TotalCase>> _getTotalCase() async{
    try{
      final remoteTotalCase = await remoteDataSource.getTotalCaseCovidInfo();
      return Right(remoteTotalCase);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TotalCaseHistory>> getTotalCaseHistoryCovidInfo() async {
    try{
      final remoteTotalCase = await remoteDataSource.getTotalCaseHistoryCovidInfo();
      return Right(remoteTotalCase);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  
}