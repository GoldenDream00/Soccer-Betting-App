import 'dart:math';

import 'package:flutter/material.dart';

import '../models/team.dart';
import '../models/fixture.dart';

class FixtureBetting extends StatefulWidget {
  final Fixture fixture;
  final Function _betFixture;

  FixtureBetting(this.fixture, this._betFixture);

  @override
  _FixtureBettingState createState() => _FixtureBettingState();
}

class _FixtureBettingState extends State<FixtureBetting> {
  final _pickController = TextEditingController();

  void _submitBet(String type, Fixture fixture) {
    if (type == null) return;
    int result;
    String winningTeam;

    int homeTeamPoints = new Random().nextInt(fixture.homeTeam.levelMax) -
        new Random().nextInt(fixture.homeTeam.levelMin);
    int awayTeamPoints = new Random().nextInt(fixture.awayTeam.levelMax) -
        new Random().nextInt(fixture.awayTeam.levelMin);

    if (homeTeamPoints > awayTeamPoints) {
      winningTeam = 'home';
      fixture.homeTeam.hasWon = true;
    } else if (homeTeamPoints < awayTeamPoints) {
      winningTeam = 'away';
      fixture.awayTeam.hasWon = true;
    } else if (homeTeamPoints == awayTeamPoints) {
      winningTeam = 'draw';
    } else {
      return;
    }

    if (type.toLowerCase() == winningTeam) {
      if (winningTeam == 'home' || winningTeam == 'away') {
        result = 3;
      } else {
        result = 1;
      }
    } else {
      result = 0;
    }

    widget._betFixture(result, fixture);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      height: 500,
      child: Column(
        children: [
          Text(
              'Home team: ${widget.fixture.homeTeam.fullName}\n Away team: ${widget.fixture.awayTeam.fullName}'),
          TextField(
            decoration: InputDecoration(
              labelText:
                  'Place your bet. Type \'HOME\', \'AWAY\' or \'DRAW\' and click Type',
            ),
            controller: _pickController,
            onSubmitted: (data) => _submitBet(data, widget.fixture),
          ),
          RaisedButton(
            onPressed: () => _submitBet(_pickController.text, widget.fixture),
            child: Text('Type'),
          ),
        ],
      ),
    );
  }
}
