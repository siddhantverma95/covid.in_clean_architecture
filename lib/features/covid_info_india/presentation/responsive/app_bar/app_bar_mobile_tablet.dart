import 'package:covid_in/core/presentation/base_screen/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class AppBarMobileTablet extends BaseStatelessWidget{

  @override
  Widget setView(context) {
    return Container(
      padding: EdgeInsets.only(bottom: bottom(24), top: top(8)),
      // decoration: BoxDecoration(
      //   color: Theme.of(context).scaffoldBackgroundColor,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.shade400,
      //       blurRadius: 8,
      //       offset: Offset(3, 3),
      //     ),
      //   ]
      // ),
      width: width(375),
      child: Text('Covid.in', style: Theme.of(context).textTheme.headline4.apply(color: Colors.black, fontWeightDelta: 2),),
      alignment: Alignment.center,
    );
  }
}