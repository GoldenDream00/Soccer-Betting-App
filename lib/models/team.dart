class Team {
  final String fullName;
  final String shortName;
  final int levelMin;
  final int levelMax;
  final String logoImagePath;
  bool hasWon;
  Team(this.fullName, this.shortName, this.levelMin, this.levelMax, this.logoImagePath) {
    hasWon = false;
  }
}
