import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage({Key? key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
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
        child: Text("This is the community page"),
      ),
    );
  }
}
