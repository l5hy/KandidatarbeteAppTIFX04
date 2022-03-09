import 'package:flutter/material.dart';
import 'testStats.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  testStats();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Innebandy',
      theme: ThemeData(
      ),
      home: TeamPage(),
    );
  }
}


class TeamPage extends StatefulWidget {

  TeamPage({Key? key}) : super(key: key);

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {

  TextStyle textStyle = const TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lag"),
        ),
        body: Column(
          children: [
            Flexible(
                child: ScrollTeam(items: teams, textStyle: textStyle)
            )
          ]
        )
    );
  }
}


class GamePage extends StatefulWidget{
  final List<Game> games;
  final String team;
  GamePage({Key? key, required this.games, required this.team}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  TextStyle textStyle = const TextStyle(fontSize: 20, color: Colors.white);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Matcher för ${widget.team}"),
        ),
        body: Column(
            children: [
              Flexible(
                  child: ScrollGame(items: widget.games,textStyle: textStyle)
              )
            ]
        )
    );
  }
}

class PlayerPage extends StatefulWidget {
  List<Player> players;
  String game;
  PlayerPage({Key? key, required this.players, required this.game}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {

  TextStyle textStyle = const TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Spelare i matchen mot ${widget.game}"),
        ),
        body: Column(
            children: [
              Flexible(
                  child: ScrollPlayer(items: widget.players, textStyle: textStyle)
              )
            ]
        )
    );
  }
}


class StatsPage extends StatelessWidget {
  final Player player;
  const StatsPage({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: Text("Statistik för spelare ${player.number}"),
        ),
        body: Column(
          children: [
            Flexible(child: Stats(player: player))
          ]
        )
    );
  }
}


class ScrollTeam extends StatelessWidget {
  final List<Team> items;
  final TextStyle textStyle;
  const ScrollTeam({Key? key, required this.items, required this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(20, MediaQuery.of(context).size.height/10),
              maximumSize: Size(50, MediaQuery.of(context).size.height/10),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GamePage(games: items[index].games, team: items[index].name)),
              );
            },
            child: Center(
              child: Text(
                items[index].name,
                style: textStyle,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

class ScrollGame extends StatelessWidget {
  final List<Game> items;
  final TextStyle textStyle;
  const ScrollGame({Key? key, required this.items, required this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(20, MediaQuery.of(context).size.height/10),
              maximumSize: Size(50, MediaQuery.of(context).size.height/10),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlayerPage(players: items[index].players, game: items[index].name)),
              );
            },
            child: Center(
              child: Text(
                items[index].name,
                style: textStyle,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
class ScrollPlayer extends StatelessWidget {
  final List<Player> items;
  final TextStyle textStyle;
  const ScrollPlayer({Key? key, required this.items, required this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(20, MediaQuery.of(context).size.height/10),
              maximumSize: Size(50, MediaQuery.of(context).size.height/10),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatsPage(player: items[index])),
              );
            },
            child: Center(
              child: Text(
                items[index].number.toString(),
                style: GoogleFonts.bebasNeue(textStyle: textStyle),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

class Stats extends StatelessWidget {
  final Player player;
  const Stats({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pad = 8;
    double boxSize = MediaQuery.of(context).size.width/2-pad;
    return SizedBox(
      child: ListView(
        padding: EdgeInsets.all(pad),
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                height: boxSize,
                width: boxSize,
                child: Center(
                  child: Image(
                    image: const AssetImage('Assets/silhouette2.png'),
                    height: boxSize/1.4,
                  ),
                ),
              ),
              SizedBox(
                height: boxSize,
                width: boxSize,
                child: Center(
                  child: Text(
                    player.number.toString(),
                    style: GoogleFonts.bebasNeue(textStyle: TextStyle(fontSize: boxSize/1.2))
                  )
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green,
            ),
            height: boxSize/4,
            width: boxSize*2,
            child: Center(
              child: Text(
                "Distans ${player.distance} meter"
              ),
            )
          )
        ],
      )
    );
  }
}


