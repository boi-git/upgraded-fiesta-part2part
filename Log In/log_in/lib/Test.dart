// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firebase_auth/firebase_auth.dart';

import 'model/user.dart' as user;
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  static final user_ = FirebaseAuth.instance.currentUser!;
  final userRef = fs.FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: user_.email)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => user.Classes.fromJson(doc.data()))
          .toList());

  Stream<List<user.Classes>> readClass() => fs.FirebaseFirestore.instance
      .collection('classlist')
      .where('email', isEqualTo: user_.email)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => user.Classes.fromJson(doc.data()))
          .toList());

  Widget buildUser(user.User user) => ListTile(
      leading: CircleAvatar(child: Text(user.name)), title: Text(user.role));

  Widget buildClass(user.Classes user) => ListTile(
      leading: CircleAvatar(child: Text(user.coursecode)),
      title: Text(user.coursename));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<user.Classes>>(
        stream: readClass(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              children: users.map(buildClass).toList(),
            );
          } else {
            return const Text("test");
          }
        },
      ),
    );
  }
}
