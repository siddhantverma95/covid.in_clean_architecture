import 'package:covid_in/core/presentation/base_screen/base_stateless_widget.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/district_zone.dart';
import 'package:covid_in/features/covid_info_india/presentation/responsive/district_zones/district_zone_desktop.dart';
import 'package:covid_in/features/covid_info_india/presentation/responsive/district_zones/district_zone_mobile.dart';
import 'package:covid_in/features/covid_info_india/presentation/responsive/district_zones/district_zone_tablet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DistrictZoneCasesView extends BaseStatelessWidget {
  final DistrictZone districtZone;
  DistrictZoneCasesView({Key key, @required this.districtZone}) : super(key: key);


  @override
  Widget setView(BuildContext context) {
    return ScreenTypeLayout.builder(
        desktop: (context) => DistrictZonesDesktop(districtZone: districtZone),
        mobile: (context) => DistrictZonesMobile(districtZones: districtZone),
        tablet: (context) => DistrictZonesTablet(districtZone: districtZone),
      );
  }
}