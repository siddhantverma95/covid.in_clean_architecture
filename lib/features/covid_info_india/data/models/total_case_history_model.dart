import 'package:covid_in/features/covid_info_india/domain/entities/total_case_history.dart';
import 'package:meta/meta.dart';

class TotalCaseHistoryModel extends TotalCaseHistory {
    final bool success;
    final List<DatumHistoryModel> data;

    TotalCaseHistoryModel({
        @required this.success,
        @required this.data, summaryModel,
    }): super(success: success, data: data);

    factory TotalCaseHistoryModel.fromJson(Map<String, dynamic> json) => TotalCaseHistoryModel(
        success: json["success"],
        data: List<DatumHistoryModel>.from(json["data"].map((x) => DatumHistoryModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DatumHistoryModel extends Datum{
    final DateTime day;
    final SummaryHistoryModel summaryModel;

    DatumHistoryModel({
        @required this.day,
        @required this.summaryModel,
    }): super(day: day, summary: summaryModel);

    factory DatumHistoryModel.fromJson(Map<String, dynamic> json) => DatumHistoryModel(
        day: DateTime.parse(json["day"]),
        summaryModel: SummaryHistoryModel.fromJson(json["summary"]),
    );

    Map<String, dynamic> toJson() => {
        "day": "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
        "summary": summaryModel.toJson(),
    };
}

class SummaryHistoryModel extends Summary {
    final int total;
    final int confirmedCasesIndian;
    final int confirmedCasesForeign;
    final int discharged;
    final int deaths;
    final int confirmedButLocationUnidentified;

    SummaryHistoryModel({
        @required this.total,
        @required this.confirmedCasesIndian,
        @required this.confirmedCasesForeign,
        @required this.discharged,
        @required this.deaths,
        @required this.confirmedButLocationUnidentified,
    }): super(total: total, confirmedCasesIndian: confirmedCasesIndian, confirmedCasesForeign: confirmedCasesForeign, discharged: discharged,
    deaths: deaths, confirmedButLocationUnidentified: confirmedButLocationUnidentified);

    factory SummaryHistoryModel.fromJson(Map<String, dynamic> json) => SummaryHistoryModel(
        total: json["total"],
        confirmedCasesIndian: json["confirmedCasesIndian"],
        confirmedCasesForeign: json["confirmedCasesForeign"],
        discharged: json["discharged"],
        deaths: json["deaths"],
        confirmedButLocationUnidentified: json["confirmedButLocationUnidentified"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "confirmedCasesIndian": confirmedCasesIndian,
        "confirmedCasesForeign": confirmedCasesForeign,
        "discharged": discharged,
        "deaths": deaths,
        "confirmedButLocationUnidentified": confirmedButLocationUnidentified,
    };
}