import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tpumps_app/main.dart';
import 'package:tpumps_app/pages/ExtraPages/login_page.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    print('signed out');
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false);
  }

  TextStyle ts = new TextStyle(color: Colors.white, fontSize: 18);
  final User user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xff232b2b),
        centerTitle: true,
        title: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.end,
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
        child: Center(
          child: Card(
            elevation: 20,
            color: Colors.red,
            child: Container(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: Text(
                      'Email: ${user.email}',
                      style: ts,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _signOut,
                    child: Text("Sign Out"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff3b444b),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
