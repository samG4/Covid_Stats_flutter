import 'package:fightcorona/model/CovideDataLocalModel.dart';
import 'package:fightcorona/utils/Constants.dart';
import 'package:flutter/material.dart';

class DataRowWidget extends StatelessWidget {
  DataRowWidget({@required this.covidDataLocalModel});

  final CovidDataLocalModel covidDataLocalModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    'Confirmed Cases',
                    style: kHeadingTextStyle.copyWith(color: Colors.redAccent),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    covidDataLocalModel.confirmedCases,
                    style: kBodyTextStyle.copyWith(color: Colors.redAccent),
                  ),
                  Text(
                    '+${covidDataLocalModel.confirmedNewCases}',
                    style: kBodyTextStyle.copyWith(color: Colors.redAccent),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    'Active Cases',
                    style: kHeadingTextStyle.copyWith(color: Colors.blueAccent),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    covidDataLocalModel.activeCases,
                    style: kBodyTextStyle.copyWith(color: Colors.blueAccent),
                  ),
                  Text(
                    '+${covidDataLocalModel.activeNewCases}',
                    style: kBodyTextStyle.copyWith(color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    'Recovered Cases',
                    style:
                        kHeadingTextStyle.copyWith(color: Colors.greenAccent),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    covidDataLocalModel.recoveredCases,
                    style: kBodyTextStyle.copyWith(color: Colors.greenAccent),
                  ),
                  Text(
                    '+${covidDataLocalModel.recoveredNewCases}',
                    style: kBodyTextStyle.copyWith(color: Colors.greenAccent),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    'Deceased Cases',
                    style: kHeadingTextStyle.copyWith(color: Colors.blueGrey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    covidDataLocalModel.deceasedCases,
                    style: kBodyTextStyle.copyWith(color: Colors.blueGrey),
                  ),
                  Text(
                    '+${covidDataLocalModel.deceasedNewCases}',
                    style: kBodyTextStyle.copyWith(color: Colors.blueGrey),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
