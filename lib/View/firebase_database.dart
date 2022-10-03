import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('board')
        .doc('q0IWu8kCAQIW5SKwpWUI')
        .snapshots(),
    builder: (context, snapshot) {
    if (!snapshot.hasData) return Text('Loading data.. please wait..');

    return ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      title: Text(
      'Rehan',
      style: TextStyle(fontSize: 20),
    ),

    );
    });
    },
        ));
  }
}
