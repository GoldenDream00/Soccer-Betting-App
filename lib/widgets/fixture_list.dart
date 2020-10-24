import 'package:flutter/material.dart';

import '../models/fixture.dart';
import './fixture_betting.dart';

class FixtureList extends StatelessWidget {
  final Function _betFixture;
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
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${fixtures[index].homeTeam.shortName}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(' vs '),
                        Text(
                          '${fixtures[index].awayTeam.shortName}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: 100,
                      child: RaisedButton.icon(
                        onPressed: () => _startBettingFixture(
                          context,
                          fixtures[index],
                        ),
                        icon: Icon(
                          Icons.sports_soccer,
                        ),
                        label: Text('BET'),
                      ),
                    ),
                  )
                : ListTile(
                    leading: Text('PL'),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${fixtures[index].homeTeam.shortName}',
                          style: fixtures[index].homeTeam.hasWon
                              ? Theme.of(context).textTheme.headline5
                              : Theme.of(context).textTheme.headline4,
                        ),
                        Text(' vs '),
                        Text(
                          '${fixtures[index].awayTeam.shortName}',
                          style: fixtures[index].awayTeam.hasWon
                              ? Theme.of(context).textTheme.headline5
                              : Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: 100,
                      child: CircleAvatar(
                        radius: 20,
                        child: Icon(
                          Icons.done,
                        ),
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
