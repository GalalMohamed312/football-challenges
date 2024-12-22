class ScoreCardModel{
  final String name;
  final String iconPath;
  final int score;
  ScoreCardModel(this.score, {required this.name,required this.iconPath});
}

class TeamWinCardModel{
  final String name;
  final String iconPath;
  TeamWinCardModel({required this.name,required this.iconPath});
}