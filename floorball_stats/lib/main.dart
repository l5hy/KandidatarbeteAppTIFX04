import 'package:flutter/material.dart';
import 'testStats.dart';

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
      home: Teams(),
    );
  }
}


class Teams extends StatefulWidget {

  Teams({Key? key}) : super(key: key);

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {

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
                child: ScrollItems(items: teams, textStyle: textStyle)
            )
          ]
        )
    );
  }
}


class Games extends StatefulWidget{
  final List<Games> games;
  Games({Key? key, required this.games}) : super(key: key);

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  List<String> games = <String>['Pixbo Wallenstam', 'Hovslätt IK', 'Jönköpings IK', 'Barnarps IF', 'Guldhedens IK', 'IK Zenith', 'Burås IK', 'Kärra IBK', 'Stenugnsunds IBK', 'FBC Vinga', 'IBF Backadalen'];

  TextStyle textStyle = const TextStyle(fontSize: 15, color: Colors.lightBlueAccent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Matcher för ${widget.team}"),
        ),
        body: Column(
            children: [
              Flexible(
                  child: ScrollItems(items: games,textStyle: textStyle)
              )
            ]
        )
    );
  }
}

class Players extends StatefulWidget {

  Players({Key? key}) : super(key: key);

  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  List<String> players = <String>['Ruben Frilund', 'Ludvig Lindahl', 'Oliver Ljung', 'Anton Levinsson', 'Amanda Levinsson', 'Masoud Shaker', 'Wilma Einarsson', '', '', '', '', '', '', '', '', '', '', '',];

  TextStyle textStyle = const TextStyle(fontSize: 25, color: Colors.green);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Spelare"),
        ),
        body: Column(
            children: [
              Flexible(
                  child: ScrollItems(items: teams, textStyle: textStyle)
              )
            ]
        )
    );
  }
}


class Stats extends StatelessWidget {
  final String player;
  const Stats({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Statistik för $player"),
        ),
        body: Column(
            children: const [

            ],
        )
    );
  }
}




class ScrollItems extends StatelessWidget {
  final List<Scroll> items;
  final TextStyle textStyle;
  const ScrollItems({Key? key, required this.items, required this.textStyle}) : super(key: key);


  //TODO: Lag från fil vid senare tillfälle

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return MaterialButton(
            height: 50,
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Games(games: items[index].name)),
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


