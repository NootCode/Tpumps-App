import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tpumps_app/pages/ExtraPages/settings_page.dart';

class MyDrinksPage extends StatefulWidget {
  MyDrinksPage({Key? key}) : super(key: key);

  @override
  _MyDrinksPageState createState() => _MyDrinksPageState();
}

class _MyDrinksPageState extends State<MyDrinksPage> {
  var myDrinks = [];
  _MyDrinksPageState() {
    final User user = FirebaseAuth.instance.currentUser!;
    final String userID = user.uid;
    refreshDrinks();
    FirebaseDatabase.instance
        .reference()
        .child("Saved Drinks/User$userID/")
        .onChildChanged
        .listen((event) {
      refreshDrinks();
    });
  }
  void refreshDrinks() {
    final User user = FirebaseAuth.instance.currentUser!;
    final String userID = user.uid;
    FirebaseDatabase.instance
        .reference()
        .child("Saved Drinks/User$userID/")
        .once()
        .then((datasnapshot) {
      print("Successfuly Loaded Data");
      var tmpDrinkList = [];
      if (datasnapshot.value != null) {
        datasnapshot.value.forEach((k, v) {
          tmpDrinkList.add(v);
        });
      }
      myDrinks = tmpDrinkList;
      setState(() {});
    }).catchError((onError) {
      print("failed to load the data");
      print(onError.toString());
    });
  }

  deleteDrink(var path) {
    final User user = FirebaseAuth.instance.currentUser!;
    final String userID = user.uid;
    print(path);
    FirebaseDatabase.instance
        .reference()
        .child('Saved Drinks/User$userID/$path')
        .remove();
    setState(() {});
    refreshDrinks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Color(0xff232b2b),
          title: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(
                  image: NetworkImage(
                      'https://static.wixstatic.com/media/131e23_5b7a1179131a40b8b7badda0ebf119ef~mv2_d_3552_1998_s_2.png/v1/crop/x_0,y_382,w_3552,h_1277/fill/w_460,h_166,al_c,q_85,usm_0.66_1.00_0.01/131e23_5b7a1179131a40b8b7badda0ebf119ef~mv2_d_3552_1998_s_2.webp'),
                  fit: BoxFit.cover,
                  height: 90,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage())),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          color: Color(0xff3b444b),
          child: Column(
            children: [
              Text(
                'My Saved Drinks',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Divider(
                color: Colors.red,
                thickness: 5,
              ),
              buildListTiles()
            ],
          ),
        ));
  }

  Widget buildListTiles() => Expanded(
          child: SizedBox(
        height: 200,
        child: ListView.builder(
            itemCount: myDrinks.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 70,
                            child: Text(
                              "${myDrinks[index]['name']}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            flex: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                deleteDrink(myDrinks[index]['key']);
                              },
                              child: Text("Delete"),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.red,
                        thickness: 3,
                      )
                    ],
                  ),
                ),
              );
            }),
      ));
}
