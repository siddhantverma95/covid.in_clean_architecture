import 'package:covid_in/core/presentation/screen_enum.dart';
import 'package:covid_in/features/covid_info_india/presentation/pages/district_zone_page.dart';
import 'package:covid_in/features/covid_info_india/presentation/pages/home_page.dart';
import 'package:covid_in/features/covid_info_india/presentation/pages/total_case_page.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var screen = Screen.values.firstWhere((e) => e.toString() == settings.name);
    switch (screen) {
      case Screen.home:
        return MaterialPageRoute(builder: (_) => HomePageView());
      case Screen.totalCase:
        return MaterialPageRoute(builder: (_) => TotalCaseView(arguments: settings.arguments));
      case Screen.districtZone:
        return MaterialPageRoute(builder: (_) => DistrictZoneView());
      default:
        return MaterialPageRoute(builder: (_) => HomePageView());
    }
    }
}
