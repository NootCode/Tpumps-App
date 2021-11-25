import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
              flex: 50,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      'Signup',
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
                      obscureText: false,
                      style: TextStyle(color: Colors.white),
                      controller: emailController,
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
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
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
                    width: 200,
                    height: 65,
                    margin: EdgeInsets.only(top: 5),
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
                        //1. get email and pass typed
                        print(emailController.text);
                        print(passwordController.text);
                        //2. send to firebase auth
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) {
                          print("Successfully signed Up");
                          Navigator.pop(context);
                        }).catchError((error) {
                          print("Failed to signup!");
                          print(error.toString());
                        });
                      },
                      child: Text("Sign Up"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
