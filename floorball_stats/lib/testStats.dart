
//TODO: Lag från fil vid senare tillfälle

import 'package:flutter/cupertino.dart';

List<Team> teams = [];

void testStats() {

  List<Player> players = [Player(0, 0, 0, 1, const AssetImage('Assets/silhouette2.png'))];
  for(int i = 1; i < 100; i++){
    players.add(Player(i, i, 15*i, i, const AssetImage('Assets/silhouette2.png'))); //number, distance, total shifttime and number of shifts (15 will be the average shifttime in this case)
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
