import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class DistrictZone extends Equatable{
    final List<Zone> zones;

    DistrictZone({
        @required this.zones,
    });

  @override
  List<Object> get props => [zones];
}

class Zone extends Equatable{
    final String district;
    final String districtcode;
    final String lastupdated;
    final String source;
    final String state;
    final String statecode;
    final String zone;

    Zone({
        @required this.district,
        @required this.districtcode,
        @required this.lastupdated,
        @required this.source,
        @required this.state,
        @required this.statecode,
        @required this.zone,
    });

  @override
  List<Object> get props => [district, districtcode, lastupdated, source, state, statecode, zone];
}
