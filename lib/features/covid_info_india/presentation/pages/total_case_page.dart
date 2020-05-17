import 'package:covid_in/core/bundle.dart';
import 'package:covid_in/core/presentation/base_screen/base_stateful_widget.dart';
import 'package:covid_in/features/covid_info_india/presentation/bloc/district_case_zone_bloc.dart';
import 'package:covid_in/features/covid_info_india/presentation/responsive/app_bar/app_bar.dart';
import 'package:covid_in/features/covid_info_india/presentation/responsive/pie_chart/pie_chart_home.dart';
import 'package:covid_in/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalCaseView extends BaseStatefulWidget {
  TotalCaseView({RouteObserver<Route> routeObserver, Key key, Bundle arguments}) : super(key);

  @override
  State<StatefulWidget> createState() => _TotalCaseViewState();
  
}

class _TotalCaseViewState extends BaseState {
  @override
  Widget setView(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              AppBarView(),
              SizedBox(height: height(10)),
              BlocProvider(
                  create: (_) => sl.get<DistrictCaseZoneBloc>(),
                  child: Container(
                    child:
                        Column(
                          children: [
                            BlocBuilder<DistrictCaseZoneBloc, DistrictCaseZoneState>(
                                bloc: sl.get<DistrictCaseZoneBloc>()
                                  ..add(LoadTotalCaseEvent()),
                                builder: (context, state) {
                                  if (state is Loading) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  else if (state is Error) {
                                    return Center(
                                      child: Text(state.message),
                                    );
                                  } else if(state is LoadedTotalCases){
                                    return TotalCasePieChartHome(totalCase: state.totalCases);
                                  }
                                  else {
                                    return Center(
                                      child: Text('Nothing!!!'),
                                    );
                                  } 
                                }),
                                
                          ],
                        ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}