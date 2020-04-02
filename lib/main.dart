import 'package:fightcorona/screens/CovidTimeline.dart';
import 'package:fightcorona/screens/LatestNews.dart';
import 'package:fightcorona/screens/LocalHospital.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.only(top: 40),
              children: <Widget>[
                ListTile(
                  title: Text('File Report'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Feeds'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Add Experience'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Donation'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.timeline)),
                Tab(icon: Icon(Icons.local_hospital)),
                Tab(icon: Icon(Icons.report)),
              ],
            ),
            title: Text('Fight Corona'),
          ),
          body: TabBarView(
            children: [
              CovidTimeLine(),
              LocalHospital(),
              LatestNews(),
            ],
          ),
        ),
      ),
    );
  }
}
