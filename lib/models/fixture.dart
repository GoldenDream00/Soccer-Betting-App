import 'package:flutter/foundation.dart';

import './team.dart';

class Fixture {
  final Team homeTeam;
  final Team awayTeam;
  bool isFinished;
  Fixture({
    @required this.homeTeam,
    @required this.awayTeam,
  }) {
    this.isFinished = false;
  }
}
