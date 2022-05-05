import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'testStats.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:window_size/window_size.dart';




void main(){
  testStats();
/*  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(600, 500));
    setWindowMaxSize(Size.infinite);
  }*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Innebandy',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[700],
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lag", style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
          Flexible(
            child: ScrollTeam(items: teams),
          ),
        ]
      ),
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
  TextStyle textStyle = const TextStyle(fontSize: 20, color: Colors.black);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Matcher för ${widget.team}", style: const TextStyle(color: Colors.black),),
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: Column(
            children: [
              Flexible(
                  child: ScrollGame(items: widget.games)
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
          title: Text("Spelare i matchen mot ${widget.game}", style: const TextStyle(color: Colors.black),),
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
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
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
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
  const ScrollTeam({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(items.isEmpty){
      return SizedBox(height: MediaQuery.of(context).size.height);
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: [MediaQuery.of(context).size.width~/300,1].reduce(max),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (7/1),
        ),
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GamePage(games: items[index].games, team: items[index].name)),
              );
            },
            child: Row(
              children: [
                const Image(
                  image: AssetImage('Assets/silhouette2.png'),
                  height: 25,
                ),
                const Image(
                  image: AssetImage('Assets/silhouette2.png'),
                  height: 35,
                ),
                const Image(
                  image: AssetImage('Assets/silhouette2.png'),
                  height: 25,
                ),
                Container(width: 20),
                Flexible(
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return Text(
                        items[index].name,
                        style: TextStyle(fontSize: constraints.maxHeight/3, color: Colors.black),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ScrollGame extends StatelessWidget {
  final List<Game> items;
  const ScrollGame({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(items.isEmpty){
      return SizedBox(height: MediaQuery.of(context).size.height);
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: [MediaQuery.of(context).size.width~/300,1].reduce(max),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (7/1),
        ),
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlayerPage(players: items[index].players, game: items[index].name)),
              );
            },
            child: Row(
              children: [
                const Image(
                  image: AssetImage('Assets/silhouette2.png'),
                  height: 25,
                ),
                const Image(
                  image: AssetImage('Assets/silhouette2.png'),
                  height: 35,
                ),
                const Image(
                  image: AssetImage('Assets/silhouette2.png'),
                  height: 25,
                ),
                Container(width: 20),
                Flexible(
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return Text(
                        items[index].name,
                        style: TextStyle(fontSize: constraints.maxHeight/3, color: Colors.black),
                      );
                    },
                  )
                ),
              ],
            )
          );
        },
      ),
    );
  }
}
class ScrollPlayer extends StatelessWidget {
  final List<Player> items;
  const ScrollPlayer({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(items.isEmpty){
      return SizedBox(height: MediaQuery.of(context).size.height);
    }
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
                          // TODO: if size of page increased when here the picture goes yeeeet, in browsers
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
              ),
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
    color: Colors.red,
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
                   style: TextStyle(
                     fontSize: boxSize/10,
                  ),
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
                  style: TextStyle(
                    fontSize: boxSize/10
                  ),
                ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: boxDec,
            height: boxSize/4,
            //width: boxSize*2,
            child: Center(
                child: Text(
                  "Genomsnittlig bytestid $averageShift",
                  style: TextStyle(
                    fontSize: boxSize/10
                  ),
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
                  style: TextStyle(
                    fontSize: boxSize/10
                  ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Center(
            child: Image(
              image: player.image,
              width: MediaQuery.of(context).size.width-pad*2,
            ),
          ),
        ],
      ),
    );
  }
}