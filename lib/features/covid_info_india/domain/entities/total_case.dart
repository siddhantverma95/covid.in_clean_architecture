import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TotalCase extends Equatable {
    final bool success;
    final Data data;
    final DateTime lastRefreshed;
    final DateTime lastOriginUpdate;

    TotalCase({
        @required this.success,
        @required this.data,
        @required this.lastRefreshed,
        @required this.lastOriginUpdate,
    });

  @override
  List<Object> get props => [success, lastRefreshed, lastOriginUpdate];
}

class Data extends Equatable {
    final Summary summary;
    final List<UnofficialSummary> unofficialSummary;
    // final List<Regional> regional;

    Data({
        @required this.summary,
        @required this.unofficialSummary,
        // @required this.regional,
    });

  @override
  List<Object> get props => [summary];
}

// class Regional {
//     final String loc;
//     final int confirmedCasesIndian;
//     final int discharged;
//     final int deaths;
//     final int confirmedCasesForeign;
//     final int totalConfirmed;

//     Regional({
//         @required this.loc,
//         @required this.confirmedCasesIndian,
//         @required this.discharged,
//         @required this.deaths,
//         @required this.confirmedCasesForeign,
//         @required this.totalConfirmed,
//     });
// }

class Summary extends Equatable{
    final int total;
    final int confirmedCasesIndian;
    final int confirmedCasesForeign;
    final int discharged;
    final int deaths;
    final int confirmedButLocationUnidentified;

    Summary({
        @required this.total,
        @required this.confirmedCasesIndian,
        @required this.confirmedCasesForeign,
        @required this.discharged,
        @required this.deaths,
        @required this.confirmedButLocationUnidentified,
    });

  @override
  List<Object> get props => [total, confirmedCasesIndian, confirmedCasesForeign, discharged, deaths, confirmedCasesForeign];
}

class UnofficialSummary extends Equatable{
    final String source;
    final int total;
    final int recovered;
    final int deaths;
    final int active;

    UnofficialSummary({
        @required this.source,
        @required this.total,
        @required this.recovered,
        @required this.deaths,
        @required this.active,
    });

  @override
  List<Object> get props => [source, total, recovered, deaths, active];
}
