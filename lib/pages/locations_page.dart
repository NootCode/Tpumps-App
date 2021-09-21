import 'package:flutter/material.dart';

class LocationsPage extends StatefulWidget {
  LocationsPage({Key? key}) : super(key: key);

  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "LOCATIONS",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                          'Tpumps Monrovia - 510 S Myrtle Ave\nMonrovia, CA 91016'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                          'Tpumps Pasadena - 524 S Lake Ave\nPasadena, CA 91101'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                          'Tpumps Upland - 657 W Foothill Blvd\nUpland, CA, 91786'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                          'Tpumps San Fransisco - 1916 Irving St\nSan Fransisco, CA, 94122'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                          'Tpumps Burlingame - 1118 Burlingame Ave\nBurlingame, CA, 94010'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                          'Tpumps Foster City - 985 E Hillsdale Blvd\nFoster City, CA, 94404'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                          'Tpumps Fremont - 42130 Blacow Rd\nFremont, CA, 94538'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      //margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                          'Tpumps San Jose - 7290 Bollinger Rd\nSan Jose, CA, 95129'),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
