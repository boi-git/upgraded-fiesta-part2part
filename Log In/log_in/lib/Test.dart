// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart' as fs;

import 'model/user.dart' as user;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  Stream<List<user.User>> readUser() => fs.FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => user.User.fromJson(doc.data())).toList());

  Stream<List<user.Classes>> readClass() => fs.FirebaseFirestore.instance
      .collection('classlist')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => user.Classes.fromJson(doc.data()))
          .toList());

  Widget buildUser(user.Classes user) => ListTile(
      leading: CircleAvatar(child: Text(user.coursecode)),
      title: Text(user.coursename));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: readClass(),
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    );
  }
}
