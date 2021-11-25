import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tpumps_app/pages/ExtraPages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong!");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.red,
              //fontFamily: 'ProximaNova',
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),
            home: LoginPage(),
          );
        }
        return new Directionality(
            textDirection: TextDirection.ltr, child: Text("Loading"));
      },
    );
  }
}
