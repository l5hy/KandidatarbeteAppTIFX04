import 'package:flutter/material.dart';
import 'testStats.dart';

void main(){
  print(teams);
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
  final String team;
  Games({Key? key, required this.team}) : super(key: key);

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
                  child: ScrollItems(items: teams,textStyle: textStyle)
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
  final Map<String,List<String>> items;
  final TextStyle textStyle;
  const ScrollItems({Key? key, required this.items, required this.textStyle}) : super(key: key);


  //TODO: Lag från fil vid senare tillfälle

  @override
  Widget build(BuildContext context) {
    List keys = items.keys.toList();
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: keys.length,
        itemBuilder: (BuildContext context, int index) {
          return MaterialButton(
            height: 50,
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            child: Center(
                child: Text(
                  keys[index],
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
