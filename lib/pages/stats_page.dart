import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
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
        child: Text("This is the stats page"),
      ),
    );
  }
}
