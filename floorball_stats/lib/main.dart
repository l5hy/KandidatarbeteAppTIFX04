import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'testStats.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Spelare i matchen mot ${widget.game}"),
        ),
        body: Column(
            children: [
              Flexible(
                  child: ScrollPlayer(items: widget.players)
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
              minimumSize: const Size(20, 20),
              maximumSize: const Size(50, 50),
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
              minimumSize: const Size(20, 20),
              maximumSize: const Size(50, 50),
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
  const ScrollPlayer({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: [MediaQuery.of(context).size.width~/150,1].reduce(max),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(20, 20),
              //maximumSize: const Size(50, 50),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatsPage(player: items[index])),
              );
            },
            child: Center(

              child: Stack(
                children: [
                  LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return SizedBox(
                          // TODO: if size of page increased when here the picture goes yeeeet
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          child: const Center(
                            child: Image(
                              image: AssetImage('Assets/silhouette2.png'),
                              //height: constraints.maxWidth,
                            ),
                          ),
                        );
                      }
                  ),
                  Center(
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.all(constraints.maxWidth/10),
                          child: Text(
                            items[index].number.toString(),
                            style: GoogleFonts.bebasNeue(
                              textStyle: TextStyle(
                                fontSize: (constraints.maxWidth)/3,
                                color: Colors.white
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )

            ),
          );
        },
      ),
    );
  }
}

class Stats extends StatelessWidget {
  final Player player;
  Stats({Key? key, required this.player}) : super(key: key);

  final BoxDecoration boxDec = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: Colors.green,
  );


  @override
  Widget build(BuildContext context) {
    final int shiftMin = player.shiftTime~/60;
    final int shiftSec = player.shiftTime-shiftMin*60;
    final int avShift = player.shiftTime~/player.shifts;
    String averageShift;
    String totalShift;
    if(shiftMin < 1){
      totalShift = "$shiftSec sekunder";
    } else{
      if(shiftSec < 10){
        totalShift = "$shiftMin:0$shiftSec";
      } else{
        totalShift = "$shiftMin:$shiftSec";
      }
    }
    if(avShift>=60){
      int min = avShift~/60;
      int sec = avShift-min*60;
      if(sec < 10){
        averageShift = "$min:0$sec";
      }else{
        averageShift = "$min:$sec";
      }
    } else{
      averageShift = "$avShift sekunder";
    }
    const double pad = 8;
    final double boxSize = MediaQuery.of(context).size.width/2-pad;
    return SizedBox(
      child: ListView(
        padding: const EdgeInsets.all(pad),
        shrinkWrap: true,
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
            decoration: boxDec,
            height: boxSize/4,
            width: boxSize*2,
            child: Center(
              child: Text(
                "Distans ${player.distance} meter",
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: boxDec,
            height: boxSize/4,
            width: boxSize*2,
            child: Center(
              child: Text(
                "Total bytestid $totalShift",
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: boxDec,
            height: boxSize/4,
            width: boxSize*2,
            child: Center(
              child: Text(
                "Genomsnittlig bytestid $averageShift",
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: boxDec,
            height: boxSize/4,
            width: boxSize*2,
            child: Center(
              child: Text(
                "Antal byten ${player.shifts}",
              ),
            ),
          ),
        ],
      ),
    );
  }
}


