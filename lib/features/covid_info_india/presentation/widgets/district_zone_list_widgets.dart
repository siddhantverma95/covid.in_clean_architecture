import 'package:covid_in/core/presentation/base_screen/base_stateful_widget.dart';
import 'package:covid_in/core/presentation/base_screen/base_stateless_widget.dart';
import 'package:covid_in/core/presentation/custom_animated_background.dart';
import 'package:covid_in/core/presentation/custom_flare.dart';
import 'package:covid_in/features/covid_info_india/domain/entities/district_zone.dart';
import 'package:covid_in/features/covid_info_india/presentation/bloc/district_case_zone_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DistrictZoneFlareActor extends BaseStatelessWidget {
  final double actorHeight;
  final double actorWidth;
  DistrictZoneFlareActor({@required this.actorHeight, @required this.actorWidth, Key key}) : super(key: key);

  @override
  Widget setView(BuildContext context) {
    return Container(
      width: actorWidth,
      height: actorHeight,
      child: CustomAnimatedBackground(
        color: Color(0xffce4e69).withOpacity(.7),
        child: Container(
          width: actorWidth,
          height: actorHeight,
          margin: EdgeInsets.only(left: left(8), right: right(8)),
          child: CustomFlareActor(
              flrPath: 'assets/flare/sneeze_flr.flr', flrAnimation: 'sneeze'),
          decoration: BoxDecoration(
              color: Color(0xffce4e69).withOpacity(.4),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Color(0xffce4e69).withOpacity(.5),
                    offset: Offset(4, 4),
                    blurRadius: 16)
              ]),
        ),
      ),
    );
  }
}
class ZoneGridTile extends BaseStatelessWidget{
  final Zone zone;
  final int index;

  ZoneGridTile({@required this.zone, @required this.index});
  @override
  Widget setView(BuildContext context) {
    return Container(
      height: height(150),
      width: width(165),
      padding: EdgeInsets.only(top: top(8)),
      margin: EdgeInsets.only(left:left(8), right:right(8),),
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
            bottom: 1,
            right: 1,
            left: 1,
            child: Container(
              height: height(120),
              width: width(165),
              padding: EdgeInsets.only(bottom: bottom(8)),
              decoration: BoxDecoration(
                      color: zone.zone == 'Red'
                        ? Colors.red.shade300.withOpacity(.6)
                        : zone.zone == 'Orange'
                            ? Colors.deepOrange.shade500.withOpacity(.5)
                            : Colors.green.shade300.withOpacity(.6),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 4,
                            offset: Offset(3, 3))
                      ]),
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                          child: Text(
                          zone.district,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1.apply(fontWeightDelta: 2),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          '${zone.zone} Zone',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
            ),
          ),
          Positioned(
            bottom: bottom(80),
            right: 1,
            left: 1,
              child: Container(
                  height: height(100),
                  width: width(165),
                  child: Image.asset(
                    zone.zone == 'Red'
                        ? 'assets/images/red_zone.png'
                        : zone.zone == 'Orange'
                            ? 'assets/images/orange_zone.png'
                            : 'assets/images/green_zone.png',
                    fit: BoxFit.contain,
                  ))),
        ],
      ),
    );
  }
}

class ZoneListTile extends BaseStatefulWidget {
  final Zone zone;
  final int index;
  ZoneListTile({
    Key key,
    @required this.zone,
    @required this.index,
  }) : super(key);

  @override
  _ZoneListTileState createState() => _ZoneListTileState();
}

class _ZoneListTileState extends BaseState<ZoneListTile> {
  @override
  Widget setView(BuildContext context) {
    return Container(
      height: 140,
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          Positioned(
            top: 45,
            child: InkWell(
              onTap: (){
                BlocProvider.of<DistrictCaseZoneBloc>(context)..add(LoadZoneEvent());
              },
              child: Container(
                width: width(370),
                height: 80,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 4,
                          offset: Offset(3, 3))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      widget.zone.district,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      '${widget.zone.zone} Zone',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              child: Container(
                  height: 110,
                  width: 110,
                  child: Image.asset(
                    widget.zone.zone == 'Red'
                        ? 'assets/images/red_zone.png'
                        : widget.zone.zone == 'Orange'
                            ? 'assets/images/orange_zone.png'
                            : 'assets/images/green_zone.png',
                    fit: BoxFit.contain,
                  ))),
        ],
      ),
    );
  }
}
