import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class DraftBox extends StatelessWidget {
  static String id = "DraftBox";
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
