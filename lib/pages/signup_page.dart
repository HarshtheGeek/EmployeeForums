import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

import 'Homepage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void Login(String email, password) async {
    try {
      Response response = await post(
          Uri.parse('https://evika.onrender.com/api/auth/signin'),
          body: {
            'email': email,
            'password': password,
          });
      if (response.statusCode == 200) {
        print("Account created successfully");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } else {
        print("Account creation failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Logo//
          const SafeArea(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Icon(
                Icons.person_pin_rounded,
                color: Colors.black,
                size: 70,
              ),
            ),
          )),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Hey user! welcome back",
            style: TextStyle(fontSize: 25),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintText: "Enter the email",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Color(0xFFEFEFEF),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                prefixIcon: Icon(Icons.lock, color: Colors.pink),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: passwordcontroller,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Color(0xFFEFEFEF),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                prefixIcon: Icon(Icons.lock, color: Colors.pink),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Login(emailcontroller.text.toString(),
                  passwordcontroller.text.toString());
            },
            child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
            ),
          )
        ],
      ),
    );
  }
}
