
import 'package:covid_in/features/covid_info_india/domain/entities/district_zone.dart';
import 'package:meta/meta.dart';

class DistrictZoneModel extends DistrictZone {
  DistrictZoneModel({
    @required List<ZoneModel> zones,
  }) : super(zones: zones);

  factory DistrictZoneModel.fromJson(Map<String, dynamic> json) =>
      DistrictZoneModel(
        zones: List<ZoneModel>.from(
            json["zones"].map((x) => ZoneModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "zones":
            List<dynamic>.from(zones.map((x) => (x as ZoneModel).toJson())),
      };
}

class ZoneModel extends Zone {
  ZoneModel({
    @required String district,
    @required String districtcode,
    @required String lastupdated,
    @required String source,
    @required String state,
    @required String statecode,
    @required String zone,
  }) : super(
            district: district,
            districtcode: districtcode,
            lastupdated: lastupdated,
            source: source,
            state: state,
            statecode: statecode,
            zone: zone);

  factory ZoneModel.fromJson(Map<String, dynamic> json) => ZoneModel(
        district: json["district"],
        districtcode: json["districtcode"],
        lastupdated: json["lastupdated"],
        source: json["source"],
        state: json["state"],
        statecode: json["statecode"],
        zone: json["zone"],
      );

  Map<String, dynamic> toJson() => {
        "district": district,
        "districtcode": districtcode,
        "lastupdated": lastupdated,
        "source": source,
        "state": state,
        "statecode": statecode,
        "zone": zone,
      };
}
