part of 'district_case_zone_bloc.dart';

abstract class DistrictCaseZoneState extends Equatable {
  const DistrictCaseZoneState();
}

class DistrictCaseZoneInitial extends DistrictCaseZoneState {
  @override
  List<Object> get props => [];
}

class Loading extends DistrictCaseZoneState {
  @override
  List<Object> get props => [];
}

class LoadedZone extends DistrictCaseZoneState {
  final DistrictZone zones;

  LoadedZone({@required this.zones});

  @override
  List<Object> get props => [zones];
}

class Error extends DistrictCaseZoneState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}

class LoadedDistrictCases extends DistrictCaseZoneState {
  final DistrictCase districtCases;

  LoadedDistrictCases({@required this.districtCases});

  @override
  List<Object> get props => [districtCases];
}

class LoadedTotalCases extends DistrictCaseZoneState {
  final TotalCase totalCases;

  LoadedTotalCases({@required this.totalCases});

  @override
  List<Object> get props => [totalCases];
}

class LoadedTotalCasesHistory extends DistrictCaseZoneState {
  final TotalCaseHistory totalCasesHistory;

  LoadedTotalCasesHistory({@required this.totalCasesHistory});

  @override
  List<Object> get props => [totalCasesHistory];
}