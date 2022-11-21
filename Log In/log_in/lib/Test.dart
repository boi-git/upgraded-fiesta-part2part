// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firebase_auth/firebase_auth.dart';
import 'model/user.dart' as user;
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key, required this.userName});
  final String userName;

  @override
  State<TestPage> createState() => _TestPageState(userName);
}

class _TestPageState extends State<TestPage> {
  String userName;
  static final user_ = FirebaseAuth.instance.currentUser!;

  _TestPageState(this.userName);

  Stream<List<user.Classes>> readClass() => fs.FirebaseFirestore.instance
      .collection('classlist')
      .where("member",
          arrayContains:
              userName) //arraycontains : username (used when log ing )
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => user.Classes.fromJson(doc.data()))
          .toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<user.Classes>>(
        stream: readClass(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error : ${snapshot.error}');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              children: users.map(buildClass).toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildUser(user.User user) => ListTile(
      leading: CircleAvatar(child: Text(user.name)), title: Text(user.role));

  Widget buildClass(user.Classes user) => ListTile(
        leading: CircleAvatar(child: Text(user.coursecode)),
        title: Text(user.coursename),
        subtitle: Text(user.lectureid),
      );

  //why not user username as uid?
  Stream<List<user.User>> readUser() => fs.FirebaseFirestore.instance
      .collection('classlist')
      .where('email', isEqualTo: user_.email)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => user.User.fromJson(doc.data())).toList());
}
