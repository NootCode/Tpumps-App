import 'package:flutter/material.dart';
import 'package:tpumps_app/model/address_settings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:map_launcher/map_launcher.dart';

class LocationsPage extends StatefulWidget {
  LocationsPage({Key? key}) : super(key: key);

  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  TextStyle ts = new TextStyle(color: Colors.white, fontSize: 15);
  List<AddressSetting> addList = [];
  _LocationsPageState() {
    AddressSetting a1 = new AddressSetting(
        title: 'Tpumps Monrovia',
        address: '510 S Myrtle Ave Monrovia, CA 91016',
        lat: 34.1467,
        lon: -118.0007);
    AddressSetting a2 = new AddressSetting(
        title: 'Tpumps Pasadena',
        address: '524 S Lake Ave Pasadena, CA 91101',
        lat: 34.1368,
        lon: -118.1320);
    AddressSetting a3 = new AddressSetting(
        title: 'Tpumps Upland',
        address: '657 W Foothill Blvd Upland, CA, 91786',
        lat: 34.1080,
        lon: -117.6589);
    AddressSetting a4 = new AddressSetting(
        title: 'Tpumps San Jose',
        address: '290 Bollinger Rd San Jose, CA, 95129',
        lat: 37.3121,
        lon: -122.0318);
    AddressSetting a5 = new AddressSetting(
        title: 'Tpumps Fremont',
        address: '42130 Blacow Rd Fremont, CA, 94538',
        lat: 37.5243,
        lon: -121.9573);
    AddressSetting a6 = new AddressSetting(
        title: 'Tpumps Foster City',
        address: '985 E Hillsdale Blvd Foster City, CA, 94404',
        lat: 37.5574,
        lon: -122.2747);
    AddressSetting a7 = new AddressSetting(
        title: 'Tpumps Burlingame',
        address: '1118 Burlingame Ave Burlingame, CA, 94010',
        lat: 37.5795,
        lon: -122.3460);
    AddressSetting a8 = new AddressSetting(
        title: 'Tpumps San Fransisco',
        address: '1916 Irving St San Fransisco, CA, 94122',
        lat: 37.7636,
        lon: -122.4786);
    addList = [a1, a2, a3, a4, a5, a6, a7, a8];
  }

  launchMap(String? title, double lat, double lon) async {
    if (await MapLauncher.isMapAvailable(MapType.google) ?? false) {
      //print('google is available');
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(lat, lon),
        title: title ?? "",
        description: "best ever",
      );
    }
    //print(maps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xff232b2b),
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
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: addList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: Text(
                  '${addList[index].title}\n${addList[index].address}',
                  style: ts,
                ),
              ),
              trailing: Container(
                width: 97,
                margin: EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  child: Text(
                    "Directions",
                    style: TextStyle(fontSize: 13),
                  ),
                  onPressed: () {
                    launchMap(addList[index].title, addList[index].lat,
                        addList[index].lon);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
