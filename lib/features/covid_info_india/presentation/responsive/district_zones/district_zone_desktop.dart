import 'package:covid_in/core/presentation/base_screen/base_stateless_widget.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/district_zone.dart';
import 'package:covid_in/features/covid_info_india/presentation/widgets/district_zone_list_widgets.dart';
import 'package:flutter/material.dart';

class DistrictZonesDesktop extends BaseStatelessWidget {
  final DistrictZone districtZone;

  DistrictZonesDesktop({@required this.districtZone});
  @override
  Widget setView(BuildContext context) {
    return Column(
      children: [
        Text(
          'District Hot Spots',
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: height(40)),
        DistrictZoneFlareActor(
          actorHeight: height(280),
          actorWidth: width(375),
        ),
        GridView.builder(
            shrinkWrap: true,
            physics: PageScrollPhysics(),
            itemCount: districtZone.zones.length,
            itemBuilder: (context, index) {
              return ZoneGridTile(
                index: index,
                zone: districtZone.zones.elementAt(index),
              );
            },
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          )
      ],
    );
  }
}
