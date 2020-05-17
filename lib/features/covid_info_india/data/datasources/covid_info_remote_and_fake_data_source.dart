import 'package:covid_in/core/error/exceptions.dart';
import 'package:covid_in/core/error/network_exception.dart';
import 'package:covid_in/core/network/constants.dart';
import 'package:covid_in/core/network/http_request.dart';
import 'package:covid_in/features/covid_info_india/data/models/district_case_model.dart';
import 'package:covid_in/features/covid_info_india/data/models/district_zone_model.dart';
import 'package:covid_in/features/covid_info_india/data/models/total_case_history_model.dart';
import 'package:covid_in/features/covid_info_india/data/models/total_case_model.dart';

abstract class CovidInfoApi{
  Future<DistrictCaseModel> getDistrictCaseCovidInfo();
  Future<DistrictZoneModel> getDistrictZoneCovidInfo();
  Future<TotalCaseModel> getTotalCaseCovidInfo();
  Future<TotalCaseHistoryModel> getTotalCaseHistoryCovidInfo();
}

class CovidInfoRemoteDataSource implements CovidInfoApi{
  final DioHttpRequest dioHttpRequest;

  CovidInfoRemoteDataSource(this.dioHttpRequest);

  @override
  Future<DistrictZoneModel> getDistrictZoneCovidInfo() async {
    try{
    final response = await dioHttpRequest.getApi(url: Constants.DISTRICT_ZONES, data: {});
    return DistrictZoneModel.fromJson(response);
    } on NetworkException{
      throw ServerException();
    }
    
  }

  @override
  Future<TotalCaseModel> getTotalCaseCovidInfo() async {
    try{
    final response = await dioHttpRequest.getApi(url: Constants.TOTAL_CASES_INDIA, data: {});
    return TotalCaseModel.fromJson(response);
    } on NetworkException{
      throw ServerException();
    }
  }

  @override
  Future<TotalCaseHistoryModel> getTotalCaseHistoryCovidInfo() async {
    try{
    final response = await dioHttpRequest.getApi(url: Constants.TOTAL_CASES_HISTORY_INDIA, data: {});
    return TotalCaseHistoryModel.fromJson(response);
    } on NetworkException{
      throw ServerException();
    }
  }

  @override
  Future<DistrictCaseModel> getDistrictCaseCovidInfo() async {
    try{
    final response = await dioHttpRequest.getApi(url: Constants.DISTRICT_CASES, data: {});
    return DistrictCaseModel.fromJson(response);
    } on NetworkException{
      throw ServerException();
    }
  }
}

class CovidInfoFakeDataSource extends CovidInfoApi{
  @override
  Future<DistrictCaseModel> getDistrictCaseCovidInfo() async {
    return Future.delayed(Duration(seconds: 1), (){
      return DistrictCaseModel(
        state: '',
        statecode: '',
        districtData: [
          DistrictDatumModel(
            district: 'Faridabad', 
          notes: 'Nothing', 
          active: 30, 
          confirmed: 80, 
          deceased: 2, 
          recovered: 48),
          DistrictDatumModel(
            district: 'Delhi', 
          notes: 'Nothing', 
          active: 2000, 
          confirmed: 5000, 
          deceased: 200, 
          recovered: 1150),
        ]
      );
    });
  }

  @override
  Future<DistrictZoneModel> getDistrictZoneCovidInfo() {
    return Future.delayed(Duration(seconds: 1), (){
      return DistrictZoneModel(zones: [
        ZoneModel(
          district: 'Faridabad', 
          districtcode: 'FBD', 
          lastupdated: '01/05/2020', 
          source: 'https://www.covid-gov.org', 
          state: 'Haryana', 
          statecode: 'HR', 
          zone: 'Red'),
      ]);
    });
  }

  @override
  Future<TotalCaseModel> getTotalCaseCovidInfo() {
    return Future.delayed(Duration(seconds: 1), (){
      return TotalCaseModel(
        success: true, 
        data: DataModel(
          summary: SummaryModel(
          total: 90927,
            confirmedCasesIndian: 90589,
            confirmedCasesForeign: 48,
            discharged: 34109,
            deaths: 2872,
            confirmedButLocationUnidentified: 290
        ),
        unofficialSummary: [
          UnofficialSummaryModel(
            source: 'https://www.covid-gov.org', 
            total: 92000, 
            recovered: 21000, 
            deaths: 1200, 
            active: 47000),
            ], 
        ), lastOriginUpdate: DateTime.now(), 
        lastRefreshed: DateTime.now());
    });
  }

  @override
  Future<TotalCaseHistoryModel> getTotalCaseHistoryCovidInfo() {
    return Future.delayed(Duration(seconds: 1), (){
      return TotalCaseHistoryModel(
        success: true, 
      data: [
        DatumHistoryModel(day: DateTime.now(), 
        summaryModel: SummaryHistoryModel(
          total: 20000, 
          confirmedCasesIndian: 19994, 
          confirmedCasesForeign: 1, 
          discharged: 2000, 
          deaths: 100, 
          confirmedButLocationUnidentified: 5))]);
    });
  }
}