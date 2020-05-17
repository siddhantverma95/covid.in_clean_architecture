import 'package:covid_in/core/presentation/base_screen/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class CovidAppBar extends BaseStatelessWidget{

  @override
  Widget setView(context) {
    return Container(
      width: width(375),
      child: Text('Covid.in', style: Theme.of(context).textTheme.headline4.apply(color: Colors.black, fontWeightDelta: 2),),
      alignment: Alignment.center,
    );
  }
}