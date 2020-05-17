import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class DistrictCase extends Equatable{
    final String state;
    final String statecode;
    final List<DistrictDatum> districtData;

    DistrictCase({
        @required this.state,
        @required this.statecode,
        @required this.districtData,
    });

  @override
  List<Object> get props => [state, statecode, districtData];
}

class DistrictDatum extends Equatable {
    final String district;
    final String notes;
    final int active;
    final int confirmed;
    final int deceased;
    final int recovered;

    DistrictDatum({
        @required this.district,
        @required this.notes,
        @required this.active,
        @required this.confirmed,
        @required this.deceased,
        @required this.recovered,
    });

  @override
  List<Object> get props => [district, notes, active, confirmed, deceased, recovered];
}
