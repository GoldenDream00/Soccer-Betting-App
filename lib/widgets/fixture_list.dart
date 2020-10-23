import 'package:flutter/material.dart';

import '../models/team.dart';
import '../models/fixture.dart';
import './fixture_betting.dart';

class FixtureList extends StatelessWidget {
  final Function _betFixture;
  // final List<Team> teams;
  final List<Fixture> fixtures;

  FixtureList(
    this._betFixture,
    this.fixtures,
  );

  void _startBettingFixture(BuildContext context, Fixture fixture) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          child: FixtureBetting(fixture, _betFixture),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            child: !fixtures[index].isFinished
                ? ListTile(
                    leading: Text('PL'),
                    title: Text(
                      '${fixtures[index].homeTeam.shortName} VS ${fixtures[index].awayTeam.shortName}',
                      textAlign: TextAlign.center,
                    ),
                    trailing: RaisedButton.icon(
                      onPressed: () =>
                          _startBettingFixture(context, fixtures[index]),
                      icon: Icon(
                        Icons.sports_soccer,
                      ),
                      label: Text('BET'),
                    ),
                  )
                : ListTile(
                    leading: Text('PL'),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${fixtures[index].homeTeam.shortName}',
                          style: TextStyle(
                              fontWeight: fixtures[index].homeTeam.hasWon
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                        Text(' VS '),
                        Text(
                          '${fixtures[index].awayTeam.shortName}',
                          style: TextStyle(
                              fontWeight: fixtures[index].awayTeam.hasWon
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ],
                    ),
                    trailing: CircleAvatar(
                      radius: 20,
                      child: Icon(
                        Icons.done,
                      ),
                    ),
                  ),
          );
        },
        itemCount: fixtures.length,
      ),
    );
  }
}
