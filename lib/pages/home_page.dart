import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 70),
            child:
                Text("TPUMPS DRINK OF THE DAY", style: TextStyle(fontSize: 25)),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Image(
              image: NetworkImage(
                  'https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg'),
            ),
          ),
          Container(
            child: Text(
              "Rose Vanilla Green Milk Tea, Normal Sweetness, Honey Boba",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
