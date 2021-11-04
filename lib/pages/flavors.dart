import 'package:flutter/material.dart';
import 'package:tpumps_app/model/flavor_settings.dart';

class FlavorPage extends StatefulWidget {
  FlavorPage({Key? key}) : super(key: key);

  @override
  _FlavorPageState createState() => _FlavorPageState();
}

class _FlavorPageState extends State<FlavorPage> {
  final flavors = [
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
    FlavorSetting(title: "Laura is a b......beautiful young lady!"),
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
      combo = " ";
    });
    flavors.forEach((element) {
      if (element.value) {
        setState(() {
          combo += element.title + " ";
        });
      }
    });
    Navigator.pop(context, combo);
  }

  decRadio() {
    setState(() {
      count -= 1;
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
        body: ListView(
          children: [
            Text("Choose up to 3 flavors!"),
            ElevatedButton(
              onPressed: () => getCombo(),
              child: Text("Save Flavors"),
            ),
            Text(combo),
            ...flavors.map(buildSingleCheckBox).toList(),
          ],
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
        title: Text(flavor.title),
      );
}
