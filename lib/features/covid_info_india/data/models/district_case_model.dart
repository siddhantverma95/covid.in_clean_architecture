import 'package:covid_in/features/covid_info_india/domain/entities/district_case.dart';
import 'package:meta/meta.dart';

class DistrictCaseModel extends DistrictCase{
    final String state;
    final String statecode;
    final List<DistrictDatumModel> districtData;

    DistrictCaseModel({
        @required this.state,
        @required this.statecode,
        @required this.districtData,
    }): super(state: state, statecode: statecode, districtData: districtData);

    factory DistrictCaseModel.fromJson(Map<String, dynamic> json) => DistrictCaseModel(
        state: json["state"],
        statecode: json["statecode"],
        districtData: List<DistrictDatum>.from(json["districtData"].map((x) => DistrictDatumModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "state": state,
        "statecode": statecode,
        "districtData": List<dynamic>.from(districtData.map((x) => x.toJson())),
    };
}

class DistrictDatumModel extends DistrictDatum {
    final String district;
    final String notes;
    final int active;
    final int confirmed;
    final int deceased;
    final int recovered;

    DistrictDatumModel({
        @required this.district,
        @required this.notes,
        @required this.active,
        @required this.confirmed,
        @required this.deceased,
        @required this.recovered,
    }): super(district: district, notes: notes, active: active, confirmed: confirmed, deceased: deceased, recovered: recovered);

    factory DistrictDatumModel.fromJson(Map<String, dynamic> json) => DistrictDatumModel(
        district: json["district"],
        notes: json["notes"],
        active: json["active"],
        confirmed: json["confirmed"],
        deceased: json["deceased"],
        recovered: json["recovered"],
    );

    Map<String, dynamic> toJson() => {
        "district": district,
        "notes": notes,
        "active": active,
        "confirmed": confirmed,
        "deceased": deceased,
        "recovered": recovered,
    };
}
