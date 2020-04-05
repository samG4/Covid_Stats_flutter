import 'dart:convert';

import 'package:fightcorona/model/CovidDataApiModel.dart';
import 'package:fightcorona/model/CovideDataLocalModel.dart';
import 'package:fightcorona/utils/Constants.dart';
import 'package:fightcorona/widget/DataRowWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
            future: new CovidDataApi().getCovidData(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var data = snapshot.data as CovidData;
                var total =
                    data.statewise.firstWhere((obj) => obj.state == 'Total');
                _statewise = data.statewise
                    .where((_state) => _state.state != 'Total')
                    .toList();
                var covidDataLocalModelTotal = new CovidDataLocalModel.AllCases(
                  activeCases: total.active,
                  activeNewCases: total.delta?.active == null
                      ? '0'
                      : total.delta?.active.toString(),
                  deceasedNewCases: total.delta?.deaths == null
                      ? '0'
                      : total.delta.deaths.toString(),
                  deceasedCases: total.deaths,
                  recoveredNewCases: total.delta?.recovered == null
                      ? '0'
                      : total.delta.recovered.toString(),
                  recoveredCases: total.recovered,
                  confirmedCases: total.confirmed,
                  confirmedNewCases: total.delta?.confirmed == null
                      ? '0'
                      : total.delta.confirmed.toString(),
                );
                return Column(
                  children: <Widget>[
                    DataRowWidget(
                      covidDataLocalModel: covidDataLocalModelTotal,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Text(
                      'State Wise',
                      style: kHeadingTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _statewise == null ? 0 : _statewise.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(_statewise[index].state),
                              subtitle: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    _statewise[index].confirmed,
                                    style: kBodyTextStyle.copyWith(
                                        color: Colors.redAccent),
                                  )),
                                  Expanded(
                                      child: Text(
                                    _statewise[index].active,
                                    style: kBodyTextStyle.copyWith(
                                        color: Colors.blueAccent),
                                  )),
                                  Expanded(
                                      child: Text(
                                    _statewise[index].recovered,
                                    style: kBodyTextStyle.copyWith(
                                        color: Colors.greenAccent),
                                  )),
                                  Expanded(
                                      child: Text(
                                    _statewise[index].deaths,
                                    style: kBodyTextStyle.copyWith(
                                        color: Colors.blueGrey),
                                  )),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
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
  }
}
