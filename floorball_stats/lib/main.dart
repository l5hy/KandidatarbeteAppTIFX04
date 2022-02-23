import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

class Teams extends StatelessWidget {
  Teams({Key? key}) : super(key: key);

  final List<String> teams = <String>['Mölndal IBF', 'Pixbo Wallenstam', 'Hovslätt IK', 'Jönköpings IK', 'Barnarps IF', 'Guldhedens IK', 'IK Zenith', 'Burås IK', 'Kärra IBK', 'Stenugnsunds IBK', 'FBC Vinga', 'IBF Backadalen'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lag"),
        ),
        body: Column(
          children: [
            Flexible(
                child: ScrollItems(items: teams)
            )
          ]
        )
    );
  }
}


class Games extends StatelessWidget {
  Games({Key? key}) : super(key: key);

  List<String> games = <String>['Pixbo Wallenstam', 'Hovslätt IK', 'Jönköpings IK', 'Barnarps IF', 'Guldhedens IK', 'IK Zenith', 'Burås IK', 'Kärra IBK', 'Stenugnsunds IBK', 'FBC Vinga', 'IBF Backadalen'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Matcher"),
        ),
        body: Column(
            children: [
              Flexible(
                  child: ScrollItems(items: games)
              )
            ]
        )
    );
  }
}



class ScrollItems extends StatelessWidget {
  final List<String> items;
  const ScrollItems({Key? key, required this.items}) : super(key: key);

  //TODO: Lag från fil vid senare tillfälle

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
        //TODO: Gör knappar av containersarna
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.black,
            child: Center(
                child: Text(
                  items[index],
                  style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
