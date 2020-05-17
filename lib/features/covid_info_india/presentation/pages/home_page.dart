import 'package:covid_in/core/presentation/base_screen/base_stateful_widget.dart';
import 'package:covid_in/features/covid_info_india/presentation/pages/district_zone_page.dart';
import 'package:covid_in/features/covid_info_india/presentation/pages/total_case_page.dart';
import 'package:flutter/material.dart';

class HomePageView extends BaseStatefulWidget {
  HomePageView({Key key}) : super(key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends BaseState<HomePageView> {
  int _index = 0;
  Widget view;
  
  @override
  void initState() {
    view = TotalCaseView();
    super.initState();
  }

  @override
  Widget setView(BuildContext context) {
    final bottomNavItems = [
      BottomNavigationBarItem(icon: Icon(Icons.dashboard), title: Text("Dashboard")),
      BottomNavigationBarItem(icon: Icon(Icons.hdr_strong), title: Text("Hot Spots")),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index){
          setState(() {
            _index = index;
            if(_index == 0){
            view = TotalCaseView();
          }else{
            view = DistrictZoneView();
          };
          });
          
        },
        items: bottomNavItems,),
        body: view,
    );
  }
}