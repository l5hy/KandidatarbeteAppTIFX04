

List<Team> teams = [];

void testStats() {

  List<Player> players = [Player(0, 0)];


  List<Game> games = [Game("opponent", players)];

  for(int i = 0; i < 3; i++){
    String team = "team " + i.toString();
    teams.add(Team(team));
    for(int j = 0; j < 3; j++){
      String game = "opponent" + j.toString();
      Player player = Player(j, 0);
      teams[i].addGame(Game(game,[player]));
    }
  }
  for(int i = 0; i < 3; i++){
    print(teams[i].games[i].players[0].number);
  }
}

class Scroll {
  late String name;
}

class Team extends Scroll{
  List<Game> games = [];
  @override
  late String name;

  Team(this.name, [games]): games = games ?? [];

  addGame(Game game){
    games.add(game);
  }
}


class Game implements Scroll{
  late List<Player> players;
  @override
  late String name;

  Game(this.name, [players]) : players = players ?? [];

  addPlayer(Player player){
    players.add(player);
  }
}

class Player implements Scroll{

  @override
  late String name;

  late int number;
  late int distance;

  Player(int number, int distance) {
    this.number = number;
    this.distance = distance;
    name = "Player " + number.toString();
  }

}
