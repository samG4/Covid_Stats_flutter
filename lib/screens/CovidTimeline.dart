import 'dart:convert';

import 'package:fightcorona/model/CovidDataApiModel.dart';
import 'package:fightcorona/model/CovideDataLocalModel.dart';
import 'package:fightcorona/utils/Constants.dart';
import 'package:fightcorona/widget/DataRowWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CovidTimeLine extends StatefulWidget {
  @override
  _CovidTimeLineState createState() => _CovidTimeLineState();
}

class _CovidTimeLineState extends State<CovidTimeLine> {
  List<CasesTimeSeries> _casesTimeSeries;
  List<KeyValues> _keyValues;
  List<Statewise> _statewise;
  List<Tested> _tested;

  void _callWeatherApi() {
    var api = new CovidDataApi();
    api.getCovidData().then((response) {
      setState(() {
        _casesTimeSeries = response.casesTimeSeries;
        _keyValues = response.keyValues;
        _statewise = response.statewise;
        _tested = response.tested;

        var total = _statewise.firstWhere((obj) => obj.state == 'Total');
        covidDataLocalModelTotal = new CovidDataLocalModel.AllCases(
          activeCases: total.active,
          activeNewCases: total.delta.active.toString(),
          deceasedNewCases: total.delta.deaths.toString(),
          deceasedCases: total.deaths,
          recoveredNewCases: total.delta.recovered.toString(),
          recoveredCases: total.recovered,
          confirmedCases: total.confirmed,
          confirmedNewCases: total.delta.confirmed.toString(),
        );
      });
    }, onError: (error) {
      setState(() {
        _casesTimeSeries = null;
        _keyValues = null;
        _statewise = null;
        _tested = null;
      });
    });
  }

  CovidDataLocalModel covidDataLocalModelTotal;

  @override
  void initState() {
    super.initState();
    _callWeatherApi();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: DataRowWidget(
                covidDataLocalModel: covidDataLocalModelTotal,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CovidDataApi {
  Future<CovidData> getCovidData() async {
    final response = await get(API_INFECTED_MAIN);
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      print("response sucess");
      Map<String, dynamic> map = jsonDecode(response.body);
      return new CovidData.fromJson(map);
    } else {
      print("response failed");
    }
//    return new CurrentWeather.fromJson(responseJson);
  }
}

/*new Scaffold(
      body: Container(
        child: Table(
          children: _statewise
              .map((item) => TableRow(children: [
                    Text(item.confirmed),
                    Text(item.active),
                  ]))
              .toList(),
        ),
      ),
    );*/
