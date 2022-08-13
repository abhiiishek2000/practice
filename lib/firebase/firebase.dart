import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final firestoreInstance = FirebaseFirestore.instance;

Future<void> createUser(String? number) async {
  firestoreInstance.collection("users").add({
    "number": number,
  }).catchError((error) => Fluttertoast.showToast(msg: "$error"));
}