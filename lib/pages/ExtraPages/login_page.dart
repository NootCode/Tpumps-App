import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tpumps_app/pages/ScreenPages/NavBar.dart';
import 'package:tpumps_app/pages/ExtraPages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xff232b2b),
        centerTitle: true,
        title: Container(
          child: Image(
            image: NetworkImage(
                'https://static.wixstatic.com/media/131e23_5b7a1179131a40b8b7badda0ebf119ef~mv2_d_3552_1998_s_2.png/v1/crop/x_0,y_382,w_3552,h_1277/fill/w_460,h_166,al_c,q_85,usm_0.66_1.00_0.01/131e23_5b7a1179131a40b8b7badda0ebf119ef~mv2_d_3552_1998_s_2.webp'),
            fit: BoxFit.cover,
            height: 90,
          ),
        ),
      ),
      body: Container(
        color: Color(0xff3b444b),
        child: Column(
          children: [
            Expanded(
              flex: 60,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 35, right: 35, bottom: 10, top: 10),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.0),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 35, right: 35, bottom: 10, top: 10),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.0),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      onPressed: () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) {
                          print('Login Successfully');
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavBar()));
                        }).catchError((onError) {
                          print('failed to login');
                          onError.toString();
                        });
                      },
                      child: Text("Login"),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    margin: EdgeInsets.only(top: 5),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      child: Text("Sign Up"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Text(""),
            )
          ],
        ),
      ),
    );
  }
}
