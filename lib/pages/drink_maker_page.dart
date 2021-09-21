import 'package:flutter/material.dart';

class DrinkMakerPage extends StatefulWidget {
  DrinkMakerPage({Key? key}) : super(key: key);

  @override
  _DrinkMakerPageState createState() => _DrinkMakerPageState();
}

class _DrinkMakerPageState extends State<DrinkMakerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            'TPUMPS',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: Center(
        child: Text("This is the DrinkMaker page"),
      ),
    );
  }
}
