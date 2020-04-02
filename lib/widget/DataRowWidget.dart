import 'package:fightcorona/model/CovideDataLocalModel.dart';
import 'package:fightcorona/utils/Constants.dart';
import 'package:flutter/material.dart';

class DataRowWidget extends StatelessWidget {
  DataRowWidget({@required this.covidDataLocalModel});

  final CovidDataLocalModel covidDataLocalModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: Column(
            children: <Widget>[
              Text(
                'Confirmed Cases',
                style: kHeadingTextStyle.copyWith(color: Colors.redAccent),
              ),
              Text(covidDataLocalModel.confirmedCases),
              Text(covidDataLocalModel.confirmedNewCases),
            ],
          ),
        ),
        Flexible(
          child: Column(
            children: <Widget>[
              Text('Active Cases',
                  style: kHeadingTextStyle.copyWith(color: Colors.blueAccent)),
              Text(covidDataLocalModel.activeCases),
              Text(covidDataLocalModel.activeNewCases),
            ],
          ),
        ),
        Flexible(
          child: Column(
            children: <Widget>[
              Text('Recovered Cases',
                  style: kHeadingTextStyle.copyWith(color: Colors.greenAccent)),
              Text(covidDataLocalModel.recoveredCases),
              Text(covidDataLocalModel.recoveredNewCases),
            ],
          ),
        ),
        Flexible(
          child: Column(
            children: <Widget>[
              Text('Deceased Cases',
                  style: kHeadingTextStyle.copyWith(color: Colors.blueGrey)),
              Text(covidDataLocalModel.deceasedCases),
              Text(covidDataLocalModel.deceasedNewCases),
            ],
          ),
        )
      ],
    );
  }
}
