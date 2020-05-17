import 'package:covid_in/core/presentation/base_screen/base_stateless_widget.dart';
import 'package:covid_in/core/presentation/custom_animated_background.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/total_case.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StopCovidWidget extends BaseStatelessWidget {
  StopCovidWidget({Key key}) : super(key: key);

  @override
  Widget setView(BuildContext context) {
    return Container(
      width: width(375),
      height: height(240),
      child: Stack(
        children: [
          Positioned(
            right: right(1),
            left: left(1),
            top: top(40),
            child: Container(
              width: width(375),
                  height: height(200),
              child: CustomAnimatedBackground(
                color: Colors.yellow.shade800,
                  child: Container(
                  width: width(375),
                  height: height(200),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Theme.of(context).accentColor.withOpacity(.4), Theme.of(context).accentColor.withOpacity(.4)],
                    begin: Alignment.bottomLeft, end: Alignment.topRight),
                    boxShadow: [
                      BoxShadow(color: Theme.of(context).accentColor.withOpacity(.3), blurRadius: 8, offset: Offset(4, 4)),
                    ],
                    //image: DecorationImage(image: AssetImage('assets/images/stop_covid.png'), fit: BoxFit.contain),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            
            child: Container(
              width: width(375),
              height: height(200),
              child: Image.asset('assets/images/stop_covid.png', fit: BoxFit.contain)),
          )
        ],
      ),
    );
  }
}

class TotalCasePieChart extends BaseStatelessWidget {
  final TotalCase totalCase;
  final double pieChartWidth;
  TotalCasePieChart({Key key, @required this.totalCase, @required this.pieChartWidth }) : super(key: key);

  @override
  Widget setView(BuildContext context) {
    UnofficialSummary summary = totalCase.data.unofficialSummary.elementAt(0);
    double death = summary.deaths.toDouble();
    double recovered = summary.recovered.toDouble();
    double total = summary.total.toDouble();
    double deathPercent = (death / total) * 100;
    double recoveredPercent = (recovered / total) * 100;
    double activePercent = 100 - (deathPercent + recoveredPercent);
    final pieSectionData = [
      PieChartSectionData(title: '${deathPercent.toStringAsPrecision(3)}%', 
      value: deathPercent,
      radius: pieChartWidth * 1.05,
      color: Theme.of(context).accentColor, showTitle: true, titleStyle: Theme.of(context).textTheme.subtitle1),
      PieChartSectionData(title: '${recoveredPercent.toStringAsPrecision(3)}%',
       value: recoveredPercent,
       radius: pieChartWidth * .9,
      color: Theme.of(context).backgroundColor, showTitle: true, titleStyle: Theme.of(context).textTheme.subtitle1),
      PieChartSectionData(title: '${activePercent.toStringAsPrecision(3)}%', value: activePercent,
      radius: pieChartWidth * .6,
      color: Theme.of(context).primaryColor, showTitle: true, titleStyle: Theme.of(context).textTheme.subtitle1.apply(color: Colors.white))
      //PieChartSectionData(title: "Confirmed Cases", value: totalCase.data.summary.total.toDouble()),
    ];
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 7,
                  child: PieChart(
                    PieChartData(
                    sections: pieSectionData,
                    centerSpaceRadius: pieChartWidth,
                    pieTouchData: PieTouchData(enabled: true),
                    sectionsSpace: 2,
                    borderData: FlBorderData(border: Border())
                  )),
                ),
                SizedBox(width: width(12),),
                Flexible(
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Indicator(
                        color: Theme.of(context).accentColor,
                        text: 'Deaths',
                        isSquare: false,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Theme.of(context).primaryColor,
                        text: 'Active',
                        isSquare: false,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Theme.of(context).backgroundColor,
                        text: 'Recovered',
                        isSquare: false,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
}
}

class CaseCountTile extends BaseStatelessWidget {
  final Color color;
  final String title;
  final int count;
  CaseCountTile({@required this.color, @required this.title, @required this.count, Key key}) : super(key: key);

  @override
  Widget setView(BuildContext context) {
    return Container(
      height: height(1),
      width: width(50),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Indicator(isSquare: false,
                text: '',
                color: color,),
                Text(title, style: Theme.of(context).textTheme.subtitle2),
              ],
            ),
            SizedBox(height: height(5)),
            Text(count.toString(), style: Theme.of(context).textTheme.headline4,),
          ],
        ),
      ),
    );
  }
}

class TotalCaseCountTile extends BaseStatelessWidget {
  final String title;
  final int count;
  TotalCaseCountTile({@required this.title, @required this.count, Key key}) : super(key: key);

  @override
  Widget setView(BuildContext context) {
    return Container(
      height: height(1),
      width: width(50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Theme.of(context).primaryColor, Theme.of(context).primaryColor.withOpacity(.6)], 
          begin: Alignment.bottomLeft, 
          end: Alignment.topRight,
          ),
          boxShadow: [
            BoxShadow(color: Theme.of(context).primaryColor.withOpacity(.5), offset: Offset(3, 3), blurRadius: 16, ),
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: Theme.of(context).textTheme.subtitle2.apply(color: Colors.white)),
              ],
            ),
            SizedBox(height: height(5)),
            Text(count.toString(), style: Theme.of(context).textTheme.headline4.apply(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }
}