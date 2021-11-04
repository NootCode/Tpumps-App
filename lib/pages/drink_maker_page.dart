import 'package:flutter/material.dart';
import 'package:tpumps_app/pages/flavors.dart';

class DrinkMakerPage extends StatefulWidget {
  DrinkMakerPage({Key? key}) : super(key: key);

  @override
  _DrinkMakerPageState createState() => _DrinkMakerPageState();
}

class _DrinkMakerPageState extends State<DrinkMakerPage> {
  String flavors = "";
  String selectedTea = "";
  bool milk = false;
  String milkType = "Lactose Free Creamer";
  String sweetVal = "";
  String topping = "";
  String result = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      flavors = "";
      selectedTea = "";
      milkType = "Lactose Free Creamer";
      sweetVal = "Normal Sweet";
      topping = "No topping";
      result = "";
    });
  }

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
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _awaitFlavors(context);
              },
              child: Text("Choose Flavors"),
            ),
            Text(flavors),
            getTea(),
            getMilk(),
            if (milk) milkDrop(),
            sweetDrop(),
            toppChoice(),
            Text(result),
            saveDrink()
          ],
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
        result += "Tea";

      result += " " + sweetVal + " with " + topping;
    });
  }

  callSave() {
    print("Saving: " + result);
  }

  Widget getTea() => Column(children: [
        Row(
          children: [
            Row(
              children: [
                Radio<String>(
                  value: "Green",
                  groupValue: selectedTea,
                  onChanged: (val) {
                    setSelectedTea(val);
                    getResult();
                  },
                ),
                Text("Green Tea")
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
                Text("Black Tea")
              ],
            )
          ],
        ),
        Row(
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
                Text("Non Caffeinated Tea")
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
                Text("Thai Tea")
              ],
            )
          ],
        )
      ]);
  Widget getMilk() => Column(
        children: [
          Text("Do you Want Milk?"),
          Row(
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
                  Text("Yes")
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
                  Text("No")
                ],
              )
            ],
          )
        ],
      );
  Widget milkDrop() => DropdownButton<String>(
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
          child: Text(value),
          value: value,
        );
      }).toList());
  Widget sweetDrop() => Column(
        children: [
          Text("Choose your Sweetness"),
          Row(
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
                  Text("Light Sweet")
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
                  Text("Normal Sweet")
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
                  Text("Very Sweet")
                ],
              ),
            ],
          )
        ],
      );
  Widget toppChoice() => DropdownButton<String>(
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
          child: Text(value),
          value: value,
        );
      }).toList());
  Widget saveDrink() => Column(children: [
        ElevatedButton(
          onPressed: () {
            callSave();
          },
          child: Text("Save to MyDrinks"),
        ),
      ]);
}
