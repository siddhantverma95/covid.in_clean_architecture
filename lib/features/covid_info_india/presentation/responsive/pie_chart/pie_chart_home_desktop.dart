import 'package:covid_in/core/presentation/base_screen/base_stateless_widget.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/total_case.dart';
import 'package:covid_in/features/covid_info_india/presentation/widgets/total_cases_pie_chart.dart';
import 'package:flutter/material.dart';

class TotalCasePieChartHomeDesktop extends BaseStatelessWidget {
  final TotalCase totalCase;
  TotalCasePieChartHomeDesktop({Key key, @required this.totalCase }) : super(key: key);

  @override
  Widget setView(BuildContext context) {
    UnofficialSummary unofficialSummary = totalCase.data.unofficialSummary.elementAt(0);
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(left(16), top(16), right(16), bottom(16)),
        child: Column(
          children: [
            //TotalCaseHistoryGraph(),
            //PieChartView(),
            StopCovidWidget(),
            SizedBox(height: height(60)),
            Text('Total Cases India', style: Theme.of(context).textTheme.headline4,),
            SizedBox(height: height(60)),
            Row(
              children: [
                Flexible(flex: 4, child: TotalCasePieChart(totalCase: totalCase, pieChartWidth: width(25),)),
                SizedBox(width: width(10)),
                Flexible(
                  flex: 2,
                    child: GridView(
                    physics: PageScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.2),
                  children: [
                    TotalCaseCountTile(title: 'Total', count: unofficialSummary.total),
                    CaseCountTile(color: Theme.of(context).accentColor, title: 'Deaths', count: unofficialSummary.deaths),
                    CaseCountTile(color: Theme.of(context).backgroundColor, title: 'Recovered', count: unofficialSummary.recovered),
                    CaseCountTile(color: Theme.of(context).primaryColor, title: 'Active', count: unofficialSummary.active),
                  ],),
                ),
              ],
            ),
          ],
        ),
      ),
    );
}
}