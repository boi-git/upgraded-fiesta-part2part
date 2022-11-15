// ignore_for_file: file_names, implementation_imports

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClassFinder extends StatefulWidget {
  const ClassFinder({super.key});

  @override
  State<ClassFinder> createState() => _ClassFinderState();
}

class _ClassFinderState extends State<ClassFinder> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Card(
        child: TextField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search), hintText: 'Search'),
          onChanged: (val) {
            setState(() {
              name = val;
            });
          },
        ),
      )),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('classlist').snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;
                    if (name.isEmpty) {
                      return ListTile(
                        title: Text(
                          data['coursecode'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          data['coursename'],
                          maxLines: 1,
                        ),
                      );
                    }
                    if (data['member']
                        .toString()
                        .contains(name.toLowerCase())) {
                      return ListTile(
                        title: Text(
                          data['coursecode'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          data['coursename'],
                          maxLines: 1,
                        ),
                      );
                    }
                    return Container();
                  },
                );
        },
      ),
    );
  }
}
