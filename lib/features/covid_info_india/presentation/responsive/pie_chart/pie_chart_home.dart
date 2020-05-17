import 'package:covid_in/features/covid_info_india/domain/entities/total_case.dart';
import 'package:covid_in/features/covid_info_india/presentation/responsive/pie_chart/pie_chart_home_desktop.dart';
import 'package:covid_in/features/covid_info_india/presentation/responsive/pie_chart/pie_chart_home_mobile_tablet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TotalCasePieChartHome extends StatelessWidget {
  final TotalCase totalCase;
  const TotalCasePieChartHome({Key key, @required this.totalCase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (context) => TotalCasePieChartHomeDesktop(totalCase: totalCase),
      mobile: (context) => TotalCasePieChartHomeMobileTablet(totalCase: totalCase),
      tablet: (context) => TotalCasePieChartHomeMobileTablet(totalCase: totalCase),
    );
  }
}