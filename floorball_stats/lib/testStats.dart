

//TODO: Lag från fil vid senare tillfälle


List<Team> teams = [];

void testStats() {

  List<Player> players = [Player(0, 0)];
  for(int i = 1; i < 50; i++){
    players.add(Player(i, i));
  }

  for(int i = 0; i < 20; i++){
    String team = "Lag " + i.toString();
    teams.add(Team(team));
    for(int j = 0; j < 20; j++){
      String game = "Motståndare " + j.toString();
      teams[i].addGame(Game(game,players));
    }
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
