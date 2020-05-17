import 'package:covid_in/features/covid_info_india/presentation/responsive/app_bar/app_bar_desktop.dart';
import 'package:covid_in/features/covid_info_india/presentation/responsive/app_bar/app_bar_mobile_tablet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: AppBarDesktop(),
      mobile: AppBarMobileTablet(),
      tablet: AppBarMobileTablet(),
    );
  }
}