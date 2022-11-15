// ignore_for_file: avoid_print, file_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:log_in/CreateUser.dart';
import 'package:log_in/Services/Auth_Services.dart';
import 'package:provider/provider.dart';

import 'ClassFinderPage.dart';
import 'HomePageScreen.dart';
import 'ProfileScreenPage.dart';
import 'Test.dart';
import 'util/BuildAppBar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //! Login Function
  static Future<User?> loginUsingEmailPassword1(
      {required String username,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("users")
          .where("username", isEqualTo: username)
          .get();
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: snap.docs[0]["email"], password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User Found");
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "MyApp Tittle",
              style: TextStyle(
                  fontSize: 28.0,
                  color: Color.fromARGB(255, 24, 23, 23),
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Login With Matric Number",
              style: TextStyle(
                  color: Color.fromARGB(255, 24, 23, 23),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 44.0,
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Matric Number",
                prefixIcon: Icon(
                  Icons.numbers,
                  color: Color.fromARGB(255, 85, 81, 81),
                ),
              ),
            ),
            const SizedBox(
              height: 26.0,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color.fromARGB(255, 85, 81, 81),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color.fromARGB(255, 243, 160, 7),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () async {
                  User? user = await loginUsingEmailPassword1(
                      username: emailController.text,
                      password: passwordController.text,
                      context: context);
                  print(user);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const TestPage()));
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color.fromARGB(255, 243, 160, 7),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CreateUser(),
                    ),
                  );
                },
                child: const Text(
                  "Create New User",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color.fromARGB(255, 243, 160, 7),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ClassFinder(),
                    ),
                  );
                },
                child: const Text(
                  "Class Finder",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color.fromARGB(255, 243, 160, 7),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: const Text(
                  "Main Menu",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
