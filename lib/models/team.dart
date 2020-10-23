class Team {
  final String fullName;
  final String shortName;
  final int levelMin;
  final int levelMax;
  bool hasWon;
  Team(this.fullName, this.shortName, this.levelMin, this.levelMax){
    hasWon = false;
  }
}
