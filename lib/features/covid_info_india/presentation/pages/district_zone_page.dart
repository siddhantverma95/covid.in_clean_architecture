import 'package:covid_in/core/presentation/base_screen/base_stateful_widget.dart';
import 'package:covid_in/features/covid_info_india/presentation/bloc/district_case_zone_bloc.dart';
import 'package:covid_in/features/covid_info_india/presentation/responsive/app_bar/app_bar.dart';
import 'package:covid_in/features/covid_info_india/presentation/responsive/district_zones/district_zone.dart';
import 'package:covid_in/features/covid_info_india/presentation/responsive/district_zones/district_zone_mobile.dart';
import 'package:covid_in/features/covid_info_india/presentation/widgets/district_zone_list_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class DistrictZoneView extends BaseStatefulWidget {
  DistrictZoneView({Key key}) : super(key);

  @override
  _DistrictZoneViewState createState() => _DistrictZoneViewState();
}

class _DistrictZoneViewState extends BaseState<DistrictZoneView> {
  @override
  Widget setView(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBarView(),
              SizedBox(height: height(20)),
              BlocProvider(
                create: (_) => sl.get<DistrictCaseZoneBloc>(),
                child: BlocBuilder<DistrictCaseZoneBloc, DistrictCaseZoneState>(
                    bloc: sl.get<DistrictCaseZoneBloc>()..add(LoadZoneEvent()),
                    builder: (context, state) {
                      if (state is Loading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is LoadedZone) {
                        return DistrictZoneCasesView(districtZone: state.zones);
                        // return GridView.builder(
                        //   shrinkWrap: true,
                        //   physics: PageScrollPhysics(),
                        //   itemCount: state.zones.zones.length,
                        //   itemBuilder: (context, index) {
                        //     return ZoneGridTile(
                        //       index: index,
                        //       zone: state.zones.zones.elementAt(index),
                        //     );
                        //   },
                        //   gridDelegate:
                        //       SliverGridDelegateWithFixedCrossAxisCount(
                        //           crossAxisCount: 2),
                        // );
                        //return Container(child: Text(state.districtCases.success.toString()),);
                      } else if (state is Error) {
                        return Center(
                          child: Text(state.message),
                        );
                      } else {
                        return Center(
                          child: Text('Server is down. Please try again later'),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
