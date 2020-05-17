import 'package:covid_in/core/presentation/base_screen/base_stateless_widget.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/total_case.dart';
import 'package:covid_in/features/covid_info_india/presentation/widgets/total_cases_pie_chart.dart';
import 'package:flutter/material.dart';

class TotalCasePieChartHomeMobileTablet extends BaseStatelessWidget {
  final TotalCase totalCase;
  TotalCasePieChartHomeMobileTablet({Key key, @required this.totalCase }) : super(key: key);

  @override
  Widget setView(BuildContext context) {
    UnofficialSummary unofficialSummary = totalCase.data.unofficialSummary.elementAt(0);
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(left(16), top(16), right(16), bottom(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TotalCaseHistoryGraph(),
            //PieChartView(),
            StopCovidWidget(),
            SizedBox(height: height(30)),
            Text('Total Cases India', style: Theme.of(context).textTheme.headline6,),
            SizedBox(height: height(20)),
            GridView(
              physics: PageScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.5),
            children: [
              TotalCaseCountTile(title: 'Total', count: unofficialSummary.total),
              CaseCountTile(color: Theme.of(context).accentColor, title: 'Deaths', count: unofficialSummary.deaths),
              CaseCountTile(color: Theme.of(context).backgroundColor, title: 'Recovered', count: unofficialSummary.recovered),
              CaseCountTile(color: Theme.of(context).primaryColor, title: 'Active', count: unofficialSummary.active),
            ],),
            SizedBox(height: height(30)),
            Text('Covid Stats', style: Theme.of(context).textTheme.headline6,),
            SizedBox(height: height(5)),
            TotalCasePieChart(totalCase: totalCase),
          ],
        ),
      ),
    );
}
}