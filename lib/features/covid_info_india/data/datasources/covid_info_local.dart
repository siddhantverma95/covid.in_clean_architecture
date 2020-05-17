import 'package:covid_in/core/custom_shared_pref.dart';
import 'package:covid_in/features/covid_info_india/data/models/district_case_model.dart';
import 'package:covid_in/features/covid_info_india/data/models/district_zone_model.dart';
import 'package:covid_in/features/covid_info_india/data/models/total_case_history_model.dart';
import 'package:covid_in/features/covid_info_india/data/models/total_case_model.dart';
import 'package:flutter/material.dart';


abstract class CovidInfoCacheApi{
  Future<DistrictCaseModel> getDistrictCaseCovidInfo();
  Future<DistrictZoneModel> getDistrictZoneCovidInfo();
  Future<TotalCaseModel> getTotalCaseCovidInfo();
  Future<TotalCaseHistoryModel> getTotalCaseHistoryCovidInfo();
}

class CovidInfoLocalDataSource implements CovidInfoCacheApi{
  final CustomSharedPreferences customSharedPreferences;

  CovidInfoLocalDataSource({@required this.customSharedPreferences}): assert(customSharedPreferences != null);
  
  @override
  Future<DistrictCaseModel> getDistrictCaseCovidInfo() {
    // TODO: implement getDistrictCaseCovidInfo
    throw UnimplementedError();
  }

  @override
  Future<DistrictZoneModel> getDistrictZoneCovidInfo() {
    // TODO: implement getDistrictZoneCovidInfo
    throw UnimplementedError();
  }

  @override
  Future<TotalCaseModel> getTotalCaseCovidInfo() {
    // TODO: implement getTotalCaseCovidInfo
    throw UnimplementedError();
  }

  @override
  Future<TotalCaseHistoryModel> getTotalCaseHistoryCovidInfo() {
    // TODO: implement getTotalCaseHistoryCovidInfo
    throw UnimplementedError();
  }
}