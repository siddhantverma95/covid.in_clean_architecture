part of 'district_case_zone_bloc.dart';

abstract class DistrictCaseZoneEvent extends Equatable {
  const DistrictCaseZoneEvent();
}

class LoadZoneEvent extends DistrictCaseZoneEvent{
  @override
  List<Object> get props => [];
}

class LoadDistrictCaseEvent extends DistrictCaseZoneEvent{
  @override
  List<Object> get props => [];
}

class LoadTotalCaseEvent extends DistrictCaseZoneEvent{
  @override
  List<Object> get props => [];
}
class LoadTotalCaseHistoryEvent extends DistrictCaseZoneEvent{
  @override
  List<Object> get props => [];
}