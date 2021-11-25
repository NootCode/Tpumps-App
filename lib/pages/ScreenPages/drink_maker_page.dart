import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tpumps_app/model/flavors.dart';
import 'package:tpumps_app/pages/ExtraPages/settings_page.dart';

class DrinkMakerPage extends StatefulWidget {
  DrinkMakerPage({Key? key}) : super(key: key);

  @override
  _DrinkMakerPageState createState() => _DrinkMakerPageState();
}

class _DrinkMakerPageState extends State<DrinkMakerPage> {
  String flavors = "";
  String selectedTea = "Green";
  bool milk = false;
  String milkType = "Lactose Free Creamer";
  String sweetVal = "";
  String topping = "";
  String result = "";

  int counter = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      flavors = "";
      selectedTea = "Green";
      milkType = "Lactose Free Creamer";
      sweetVal = "Normal Sweet";
      topping = "No topping";
      result = "Green Tea Normal Sweet with No Topping";
    });
  }

  TextStyle ts = new TextStyle(color: Colors.white, fontSize: 16);
  TextStyle questionTs = new TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _awaitFlavors(context);
                      },
                      child: Text(
                        "Choose Flavors",
                        style: questionTs,
                      ),
                    ),
                    Text(
                      flavors,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    getTea(),
                    getMilk(),
                    if (milk) milkDrop(),
                    sweetDrop(),
                    toppChoice(),
                    Divider(
                      color: Colors.red,
                      thickness: 3,
                    ),
                    Center(
                      child: Text(
                        "Drink Created",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          result,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    saveDrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _awaitFlavors(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FlavorPage()),
    );
    setState(() {
      flavors = result;
    });
    getResult();
    //print(flavors);
  }

  setSelectedTea(String? val) {
    setState(() {
      selectedTea = val ?? "";
    });
  }

  setMilk(bool? val) {
    setState(() {
      milk = val ?? false;
    });
  }

  getResult() {
    setState(() {
      result = flavors + "" + selectedTea;
      if (milk && milkType != "Lactose Free Creamer")
        result += " Milk Tea with " + milkType;
      else if (milk)
        result += " Milk Tea";
      else
        result += " Tea";

      result += " " + sweetVal + " with " + topping;
    });
  }

  callSave() {
    print("Saving: " + result);
    var timestamp = new DateTime.now().millisecondsSinceEpoch;
    final User user = FirebaseAuth.instance.currentUser!;
    final String userID = user.uid;

    FirebaseDatabase.instance
        .reference()
        .child("Saved Drinks/User$userID/Drink " + timestamp.toString())
        .set({'name': result, 'key': 'Drink $timestamp'})
        .then((value) => print('Successfully Saved Drink'))
        .catchError((error) {
          print("failed");
          print(error.toString());
        });

    counter++;
  }

  Widget getTea() => Column(children: [
        Divider(
          color: Colors.red,
          thickness: 3,
        ),
        Text("Select your Tea:", style: questionTs),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: "Green",
                  groupValue: selectedTea,
                  onChanged: (val) {
                    setSelectedTea(val);
                    getResult();
                  },
                ),
                Text("Green Tea", style: ts)
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: "Black",
                  groupValue: selectedTea,
                  onChanged: (val) {
                    setSelectedTea(val);
                    getResult();
                  },
                ),
                Text("Black Tea", style: ts)
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Radio<String>(
                  value: "Non Caffeinated",
                  groupValue: selectedTea,
                  onChanged: (val) {
                    setSelectedTea(val);
                    getResult();
                  },
                ),
                Text("Non Caffeinated Tea", style: ts)
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: "Thai",
                  groupValue: selectedTea,
                  onChanged: (val) {
                    setSelectedTea(val);
                    getResult();
                  },
                ),
                Text("Thai Tea", style: ts)
              ],
            )
          ],
        )
      ]);
  Widget getMilk() => Column(
        children: [
          Divider(
            color: Colors.red,
            thickness: 3,
          ),
          Text("Do you Want Milk?", style: questionTs),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: milk,
                    onChanged: (val) {
                      setMilk(val);
                      getResult();
                    },
                  ),
                  Text("Yes", style: ts)
                ],
              ),
              Row(
                children: [
                  Radio<bool>(
                    value: false,
                    groupValue: milk,
                    onChanged: (val) {
                      setMilk(val);
                      getResult();
                    },
                  ),
                  Text("No", style: ts)
                ],
              )
            ],
          )
        ],
      );
  Widget milkDrop() => DropdownButton<String>(
      dropdownColor: Colors.black,
      value: milkType,
      onChanged: (String? newValue) {
        setState(() {
          milkType = newValue!;
          getResult();
        });
      },
      items: <String>[
        "Lactose Free Creamer",
        "Almond Milk",
        "Oat Milk",
        "Soy Milk"
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(
          child: Text(value, style: ts),
          value: value,
        );
      }).toList());
  Widget sweetDrop() => Column(
        children: [
          Divider(
            color: Colors.red,
            thickness: 3,
          ),
          Text("Choose your Sweetness", style: questionTs),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Radio<String>(
                    value: "Light Sweet",
                    groupValue: sweetVal,
                    onChanged: (val) {
                      setState(() {
                        sweetVal = val!;
                      });
                      getResult();
                    },
                  ),
                  Text("Light", style: ts)
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: "Normal Sweet",
                    groupValue: sweetVal,
                    onChanged: (val) {
                      setState(() {
                        sweetVal = val!;
                      });
                      getResult();
                    },
                  ),
                  Text("Normal", style: ts)
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: "Very Sweet",
                    groupValue: sweetVal,
                    onChanged: (val) {
                      setState(() {
                        sweetVal = val!;
                      });
                      getResult();
                    },
                  ),
                  Text("Very", style: ts)
                ],
              ),
            ],
          )
        ],
      );
  Widget toppChoice() => Column(
        children: [
          Divider(
            color: Colors.red,
            thickness: 3,
          ),
          Text("Choose a Topping", style: questionTs),
          DropdownButton<String>(
              dropdownColor: Colors.black,
              value: topping,
              onChanged: (String? newValue) {
                setState(() {
                  topping = newValue!;
                  getResult();
                });
              },
              items: <String>[
                "No topping",
                "Honey Boba",
                "Strawberry Popping Boba",
                "Mango Popping Boba",
                "Passion Fruit Popping Boba",
                "Lychee Popping Boba",
                "Boba Bran",
                "Taro Chunks",
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  child: Text(value, style: ts),
                  value: value,
                );
              }).toList()),
        ],
      );
  Widget saveDrink() => Column(children: [
        ElevatedButton(
          onPressed: () {
            callSave();
          },
          child: Text("Save to MyDrinks", style: ts),
        ),
      ]);
}
