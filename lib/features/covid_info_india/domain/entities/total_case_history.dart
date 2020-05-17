import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TotalCaseHistory extends Equatable{
    final bool success;
    final List<Datum> data;

    TotalCaseHistory({
        @required this.success,
        @required this.data,
    });

  @override
  List<Object> get props => [success, data];
}

class Datum extends Equatable {
    final DateTime day;
    final Summary summary;

    Datum({
        @required this.day,
        @required this.summary,
    });

  @override
  List<Object> get props => [day, summary];
}

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
  List<Object> get props => [total, confirmedCasesIndian, confirmedCasesForeign, discharged, deaths, confirmedButLocationUnidentified];
}