import 'package:flutter/material.dart';
import 'package:tpumps_app/model/flavor_settings.dart';

class FlavorPage extends StatefulWidget {
  FlavorPage({Key? key}) : super(key: key);

  @override
  _FlavorPageState createState() => _FlavorPageState();
}

class _FlavorPageState extends State<FlavorPage> {
  final flavor1 = [
    FlavorSetting(title: "Mango"),
    FlavorSetting(title: "Peach"),
    FlavorSetting(title: "Passion Fruit"),
    FlavorSetting(title: "Strawberry"),
    FlavorSetting(title: "Coconut"),
    FlavorSetting(title: "Vanilla"),
    FlavorSetting(title: "Rose"),
    FlavorSetting(title: "Lychee"),
    FlavorSetting(title: "Lavender"),
    FlavorSetting(title: "Watermelon"),
    FlavorSetting(title: "Kiwi"),
    FlavorSetting(title: "Lemon"),
    FlavorSetting(title: "Guava"),
    FlavorSetting(title: "Pomegranate"),
    FlavorSetting(title: "Pineapple"),
    FlavorSetting(title: "Green Apple"),
    FlavorSetting(title: "Banana"),
    FlavorSetting(title: "Plum"),
    //FlavorSetting(title: "Laura is a b......beautiful young lady!"),
  ];

  final flavor2 = [
    FlavorSetting(title: "Cherry"),
    FlavorSetting(title: "BlackBerry"),
    FlavorSetting(title: "Almond"),
    FlavorSetting(title: "Blueberry"),
    FlavorSetting(title: "Tangerine"),
    FlavorSetting(title: "Raspberry"),
    FlavorSetting(title: "Almond Roca"),
    FlavorSetting(title: "Cinnamon"),
    FlavorSetting(title: "Brown Sugar"),
    FlavorSetting(title: "Caramel"),
    FlavorSetting(title: "Hazelnut"),
    FlavorSetting(title: "Peppermint"),
    FlavorSetting(title: "Pumpkin Spice"),
    FlavorSetting(title: "Gingerbread"),
    FlavorSetting(title: "Marshmallow"),
    FlavorSetting(title: "Salted Caramel"),
    FlavorSetting(title: "Cookie Dough"),
    FlavorSetting(title: "Honey"),
    FlavorSetting(title: "Chocolate"),
    FlavorSetting(title: "Taro"),
    FlavorSetting(title: "Honeydew"),
    FlavorSetting(title: "Red Bean"),
  ];

  int count = 0;
  String combo = "sup";

  @override
  void initState() {
    super.initState();
    setState(() {
      count = 0;
      combo = ' ';
    });
  }

  incRadio() {
    setState(() {
      count += 1;
    });
  }

  getCombo() {
    setState(() {
      combo = "";
    });
    flavor1.forEach((element) {
      if (element.value) {
        setState(() {
          combo += element.title + " ";
        });
      }
    });
    flavor2.forEach((element) {
      if (element.value) {
        setState(() {
          combo += element.title + " ";
        });
      }
    });
  }

  decRadio() {
    setState(() {
      count -= 1;
    });
  }

  clear() {
    flavor1.forEach((element) {
      element.value = false;
      setState(() {
        count = 0;
        combo = "";
      });
    });
    flavor2.forEach((element) {
      element.value = false;
      setState(() {
        count = 0;
        combo = "";
      });
    });
  }

  sendCombo() {
    Navigator.pop(context, combo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.red,
          title: Center(
            child: Image(
              image: NetworkImage(
                  'https://static.wixstatic.com/media/131e23_5b7a1179131a40b8b7badda0ebf119ef~mv2_d_3552_1998_s_2.png/v1/crop/x_0,y_382,w_3552,h_1277/fill/w_460,h_166,al_c,q_85,usm_0.66_1.00_0.01/131e23_5b7a1179131a40b8b7badda0ebf119ef~mv2_d_3552_1998_s_2.webp'),
              fit: BoxFit.cover,
              height: 100,
            ),
          ),
        ),
        body: Container(
          color: Color(0xff3b444b),
          child: ListView(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 10),
                  child: Text(
                    "Choose up to 3 flavors!",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(
                        top: 5, bottom: 10, left: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () => sendCombo(),
                      child: Text(
                        "Save Flavors",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(
                        top: 5, bottom: 10, left: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () => clear(),
                      child:
                          Text("Clear Flavors", style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  "My Flavors:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              Center(
                child: Text(
                  combo,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              ...flavor1.map(buildSingleCheckBox).toList(),
              ...flavor2.map(buildSingleCheckBox).toList(),
            ],
          ),
        ));
  }

  Widget buildSingleCheckBox(FlavorSetting flavor) => buildCheckbox(
      flavor: flavor,
      onClicked: () {
        setState(() {
          final newValue = !flavor.value;
          flavor.value = newValue;
          if (newValue == true)
            incRadio();
          else
            decRadio();
          getCombo();
        });
      });

  Widget buildCheckbox({
    required FlavorSetting flavor,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: () => (count != 3 || flavor.value) ? onClicked() : null,
        leading: Checkbox(
          value: flavor.value,
          onChanged:
              (count != 3 || flavor.value) ? (value) => onClicked() : null,
        ),
        title: Text(
          flavor.title,
          style: TextStyle(color: Colors.white),
        ),
      );
}
