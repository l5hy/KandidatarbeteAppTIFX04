import 'package:flutter/material.dart';

void main() => runApp(MyApp());

var prog = 0.0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Innebandy',
      theme: ThemeData(
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lag"),
        ),
        body: Column(
          children: [
            Teams(),
          ],
        )
    );
  }
}


class Teams extends StatelessWidget {
  Teams({Key? key}) : super(key: key);

  //TODO: Lag från fil vid senare tillfälle
  final List<String> tms = <String>['Mölndal IBF', 'Pixbo Wallenstam', 'Hovslätt IK', 'Jönköpings IK', 'Barnarps IF'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-119,
      child: ListView.separated(
        //TODO: Gör knappar av containersarna
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: tms.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.black,
            child: Center(
                child: Text(
                  tms[index],
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
