import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_in/core/error/failures.dart';
import 'package:covid_in/core/usecases/usecase.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/district_case.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/district_zone.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/total_case.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/total_case_history.dart';
import 'package:covid_in/features/covid_info_india/domain/usecases/get_covid_case.dart';
import 'package:covid_in/features/covid_info_india/domain/usecases/get_covid_zones.dart';
import 'package:covid_in/features/covid_info_india/domain/usecases/get_total_case.dart';
import 'package:covid_in/features/covid_info_india/domain/usecases/get_total_case_history.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'district_case_zone_event.dart';
part 'district_case_zone_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class DistrictCaseZoneBloc extends Bloc<DistrictCaseZoneEvent, DistrictCaseZoneState> {
  final GetCovidCase getCovidCase;
  final GetCovidZone getCovidZone;
  final GetTotalCase getTotalCase;
  final GetTotalCaseHistory getTotalCaseHistory;

  DistrictCaseZoneBloc({
    @required this.getCovidCase, 
    @required this.getCovidZone,
    @required this.getTotalCase,
    @required this.getTotalCaseHistory,})
    : assert(getCovidCase != null),
    assert(getCovidZone != null),
    assert(getTotalCase != null),
    assert(getTotalCaseHistory != null);

  @override
  DistrictCaseZoneState get initialState => DistrictCaseZoneInitial();

  @override
  Stream<DistrictCaseZoneState> mapEventToState(
    DistrictCaseZoneEvent event,
  ) async* {
    if(event is LoadDistrictCaseEvent){
      yield* _loadDistrictCasesOrError();
    }
    if(event is LoadZoneEvent){
      yield* _loadZoneOrError();
    }
    if(event is LoadTotalCaseEvent){
      yield* _loadTotalCasesOrError();
    }
    if(event is LoadTotalCaseHistoryEvent){
      yield* _loadTotalCasesHistoryOrError();
    }
  }

  Stream<DistrictCaseZoneState> _loadZoneOrError() async* {
    yield Loading();
    final failureOrZones = await getCovidZone(NoParams());
    yield failureOrZones.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (zones) {
        zones.zones.sort((a,b) => a.district.compareTo(b.district));
        return LoadedZone(zones: zones);}
    );
  }

  Stream<DistrictCaseZoneState> _loadDistrictCasesOrError() async* {
    yield Loading();
    final failureOrZones = await getCovidCase(NoParams());
    yield failureOrZones.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (cases) => LoadedDistrictCases(districtCases: cases),
    );
  }

  Stream<DistrictCaseZoneState> _loadTotalCasesOrError() async* {
    yield Loading();
    final failureOrTotalCases = await getTotalCase(NoParams());
    yield failureOrTotalCases.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (cases) => LoadedTotalCases(totalCases: cases),
    );
  }

  Stream<DistrictCaseZoneState> _loadTotalCasesHistoryOrError() async* {
    yield Loading();
    final failureOrTotalCases = await getTotalCaseHistory(NoParams());
    yield failureOrTotalCases.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (cases) => LoadedTotalCasesHistory(totalCasesHistory: cases),
    );
  }
  
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
