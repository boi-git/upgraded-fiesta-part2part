// ignore_for_file: avoid_print, file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<Object?> login(
      String username, String password, BuildContext context) async {
    User? user;
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("users")
          .where("username", isEqualTo: username)
          .get();
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: snap.docs[0]["email"], password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User Found");
      }
    }
    return null;
  }

  Future<Object> signUp(
      String email, String password, String role, String username) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User? user = FirebaseAuth.instance.currentUser;

        if (role.toString() == 'Student') {
          await FirebaseFirestore.instance
              .collection("students")
              .doc(user!.uid)
              .set(
            {
              'uid': user.uid,
              'email': email,
              'username': username,
              'role': role,
              'password': password,
            },
          );
        } else {
          await FirebaseFirestore.instance
              .collection("lectures")
              .doc(user!.uid)
              .set(
            {
              'uid': user.uid,
              'email': email,
              'username': username,
              'role': role,
              'password': password,
            },
          );
        }
      });
      return "Signed Up";
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<User?> loginUsingEmailPassword(
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
    return null;
  }
}
