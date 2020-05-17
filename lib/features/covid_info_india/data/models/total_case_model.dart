import 'package:covid_in/features/covid_info_india/domain/entities/total_case.dart';
import 'package:meta/meta.dart';

class TotalCaseModel extends TotalCase{
    TotalCaseModel({
        @required bool success,
        @required DataModel data,
        @required DateTime lastRefreshed,
        @required DateTime lastOriginUpdate,
    }): super(data: data, lastOriginUpdate: lastOriginUpdate, lastRefreshed: lastRefreshed, success: success);

    factory TotalCaseModel.fromJson(Map<String, dynamic> json) => TotalCaseModel(
        success: json["success"],
        data: DataModel.fromJson(json["data"]),
        lastRefreshed: DateTime.parse(json["lastRefreshed"]),
        lastOriginUpdate: DateTime.parse(json["lastOriginUpdate"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        //"data": (data as DataModel).toJson(),
        "lastRefreshed": lastRefreshed.toIso8601String(),
        "lastOriginUpdate": lastOriginUpdate.toIso8601String(),
    };
}

class DataModel extends Data{
    
    DataModel({
        @required SummaryModel summary,
        @required List<UnofficialSummaryModel> unofficialSummary,
        // @required List<RegionalModel> regional,
    }): super(summary: summary, unofficialSummary: unofficialSummary);

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        summary: SummaryModel.fromJson(json["summary"]),
        unofficialSummary: List<UnofficialSummaryModel>.from(json["unofficial-summary"].map((x) => UnofficialSummaryModel.fromJson(x))),
        // regional: List<RegionalModel>.from(json["regional"].map((x) => RegionalModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "summary": (summary as SummaryModel).toJson(),
        "unofficial-summary": List<dynamic>.from(unofficialSummary.map((x) => (x as UnofficialSummaryModel).toJson())),
        // "regional": List<dynamic>.from(regional.map((x) => (x as RegionalModel).toJson())),
    };
}

// class RegionalModel extends Regional {
    
//     RegionalModel({
//         @required String loc,
//         @required int confirmedCasesIndian,
//         @required int discharged,
//         @required int deaths,
//         @required int confirmedCasesForeign,
//         @required int totalConfirmed,
//     });

//     factory RegionalModel.fromJson(Map<String, dynamic> json) => RegionalModel(
//         loc: json["loc"],
//         confirmedCasesIndian: json["confirmedCasesIndian"],
//         discharged: json["discharged"],
//         deaths: json["deaths"],
//         confirmedCasesForeign: json["confirmedCasesForeign"],
//         totalConfirmed: json["totalConfirmed"],
//     );

//     Map<String, dynamic> toJson() => {
//         "loc": loc,
//         "confirmedCasesIndian": confirmedCasesIndian,
//         "discharged": discharged,
//         "deaths": deaths,
//         "confirmedCasesForeign": confirmedCasesForeign,
//         "totalConfirmed": totalConfirmed,
//     };
// }

class SummaryModel extends Summary {
    
    SummaryModel({
        @required int total,
        @required int confirmedCasesIndian,
        @required int confirmedCasesForeign,
        @required int discharged,
        @required int deaths,
        @required int confirmedButLocationUnidentified,
    }): super(total: total, confirmedCasesForeign: confirmedCasesForeign, confirmedCasesIndian: confirmedCasesIndian, discharged: discharged,
    deaths: deaths, confirmedButLocationUnidentified: confirmedButLocationUnidentified);

    factory SummaryModel.fromJson(Map<String, dynamic> json) => SummaryModel(
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

class UnofficialSummaryModel extends UnofficialSummary {
    

    UnofficialSummaryModel({
        @required String source,
        @required int total,
        @required int recovered,
        @required int deaths,
        @required int active,
    }):super(source: source, total:total, recovered: recovered, deaths: deaths, active: active);

    factory UnofficialSummaryModel.fromJson(Map<String, dynamic> json) => UnofficialSummaryModel(
        source: json["source"],
        total: json["total"],
        recovered: json["recovered"],
        deaths: json["deaths"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "source": source,
        "total": total,
        "recovered": recovered,
        "deaths": deaths,
        "active": active,
    };
}
