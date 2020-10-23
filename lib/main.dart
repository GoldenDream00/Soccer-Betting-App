import 'package:flutter/material.dart';

import './widgets/fixture_list.dart';
import './models/fixture.dart';
import './models/team.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var myScore = 0;
  bool flag = false;

  final List<Team> _teams = [
    Team('Everton', 'EVE', 3, 7, 'assets/images/everton.png'),
    Team('Aston Villa', 'AVI', 2, 5, 'assets/images/astonvilla.png'),
    Team('Liverpool', 'LIV', 4, 10, 'assets/images/liverpool.png'),
    Team('Arsenal', 'ARS', 3, 8, 'assets/images/arsenal.png'),
    Team('Wolverhampton Wanderers', 'WOL', 3, 7,
        'assets/images/wolverhampton.png'),
    Team('Tottenham Hotspur', 'TOT', 3, 8, 'assets/images/tottenham.png'),
    Team('Chelsea', 'CHE', 3, 7, 'assets/images/chelsea.png'),
    Team('West Ham United', 'WHU', 2, 6, 'assets/images/westham.png'),
    Team('Leeds United', 'LEE', 2, 6, 'assets/images/leeds.png'),
    Team('Manchester City', 'MCI', 4, 10, 'assets/images/manchestercity.png'),
    Team('Southampton', 'SOU', 2, 6, 'assets/images/southampton.png'),
    Team('Newcastle United', 'NEW', 2, 6, 'assets/images/newcastle.png'),
    Team('Crystal Palace', 'CRY', 2, 6, 'assets/images/crystal.png'),
    Team(
        'Manchester United', 'MUN', 4, 8, 'assets/images/manchesterunited.png'),
    Team('Brighton & Hove Albion', 'BHA', 2, 6, 'assets/images/brighton.png'),
    Team('West Bromwich Albion', 'WBA', 2, 6, 'assets/images/westbromwich.png'),
    Team('Burnley', 'BUR', 2, 6, 'assets/images/burnley.png'),
    Team('Leicester City', 'LEI', 3, 7, 'assets/images/leicester.png'),
    Team('Sheffield United', 'SHE', 2, 6, 'assets/images/sheffield.png'),
    Team('Fulham', 'FUL', 2, 5, 'assets/images/fulham.png'),
  ];

  final List<Fixture> _fixtures = [];

  void _betFixture(int result, Fixture fixture) {
    setState(() {
      myScore += result;
      fixture.isFinished = true;
    });
  }

  void _shuffleAndStart() {
    _teams.shuffle();
    for (var i = 0; i < _teams.length / 2; i++) {
      _fixtures.add(
        Fixture(homeTeam: _teams[(i * 2)], awayTeam: _teams[(i * 2) + 1]),
      );
    }
    setState(() {
      flag = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My score $myScore'),
        actions: [],
      ),
      body: Column(
        children: [
          !flag
              ? RaisedButton(
                  child: Text('PLAY'),
                  onPressed: _shuffleAndStart,
                )
              : Container(
                  height: 700,
                  child: FixtureList(_betFixture, _fixtures),
                ),
        ],
      ),
    );
  }
}
