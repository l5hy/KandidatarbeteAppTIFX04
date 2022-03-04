

List<Team> teams = [];

void testStats() {

  List<Player> players = [Player(0, 0)];

  List<Game> games = [Game("Motståndare", players)];

  for(int i = 0; i < 3; i++){
    String team = "Lag " + i.toString();
    teams.add(Team(team));
    for(int j = 0; j < 3; j++){
      String game = "Motståndare " + j.toString();
      Player player = Player(j, 0);
      teams[i].addGame(Game(game,[player]));
    }
  }
  for(int i = 0; i < 3; i++){
    print(teams[i].games[i].players[0].number);
  }
}

class Team{
  List<Game> games = [];
  late String name;

  Team(this.name, [games]): games = games ?? [];

  addGame(Game game){
    games.add(game);
  }
}


class Game{
  late List<Player> players;
  late String name;

  Game(this.name, [players]) : players = players ?? [];

  addPlayer(Player player){
    players.add(player);
  }
}

class Player{
  late int number;
  late int distance;

  Player(this.number, this.distance);
}
