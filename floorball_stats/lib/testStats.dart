
//TODO: Lag från fil vid senare tillfälle

import 'package:flutter/cupertino.dart';

List<Team> teams = [];
List allTeams = [
  "Pixbo",
  "Thorengruppen",
  "Rönnby",
  "Endre",
  "Sirius",
  "Falun",
  "Nacka",
  "Malmö",
  "Karlstad",
  "Täby",
  "Warberg",
  "Lund",
  "Mora",
  "Jönköping"];

List<Player> players = [
  Player(2, 4896, 1135, 26, const AssetImage('Assets/histogram.jpg')),
  Player(3, 4896, 1135, 26, const AssetImage('Assets/histogram.jpg')),
  Player(5, 4896, 1135, 26, const AssetImage('Assets/histogram.jpg')),
  Player(2, 4896, 1135, 26, const AssetImage('Assets/histogram.jpg')),
  Player(2, 4896, 1135, 26, const AssetImage('Assets/histogram.jpg')),
  Player(2, 4896, 1135, 26, const AssetImage('Assets/histogram.jpg')),
  Player(13, 4632, 1135, 26, const AssetImage('Assets/histogram.jpg')),
  Player(16, 5403, 1135, 26, const AssetImage('Assets/histogram.jpg')),
  Player(17, 1965, 1135, 26, const AssetImage('Assets/histogram.jpg')),
  Player(22, 3951, 1135, 26, const AssetImage('Assets/histogram.jpg')),
  Player(36, 4325, 1135, 26, const AssetImage('Assets/heatmap.jpg')),
  Player(47, 3659, 1135, 26, const AssetImage('Assets/heatmap.jpg')),
  Player(49, 4103, 1135, 26, const AssetImage('Assets/heatmap.jpg')),
  Player(63, 1365, 1135, 26, const AssetImage('Assets/heatmap.jpg')),
  Player(68, 2698, 1135, 26, const AssetImage('Assets/heatmap.jpg')),
  Player(79, 3986, 1135, 26, const AssetImage('Assets/heatmap.jpg')),
  Player(94, 4586, 1135, 26, const AssetImage('Assets/heatmap.jpg')),
];
void testStats() {



/*  for(int i = 1; i < 100; i++){
    players.add(Player(i, i, 15*i, i, const AssetImage('Assets/heatmap.jpg'))); //number, distance, total shifttime and number of shifts (15 will be the average shifttime in this case)
  }

  for(int i = 0; i < 90; i++){
    String team = "Lag " + i.toString();
    teams.add(Team(team));
    for(int j = 0; j < 90; j++){
      String game = "Motståndare " + j.toString();
      teams[i].addGame(Game(game,players));
    }
    teams[i].addGame(Game("svenska bananböjarnas innebandyförening", players));
  }
  teams.add(Team("svenska bananböjarnas innebandyförening"));
*/
  for(String i in allTeams){
    teams.add(Team(i));
    for(String j in allTeams){
      if(j != i){
        teams[teams.length-1].addGame(Game(j, players));
      }
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
  late int shiftTime; //Total shifttime in seconds
  late int shifts; //Total amount of shifts
  late ImageProvider image;

  Player(this.number, this.distance, this.shiftTime, this.shifts, this.image);
}
