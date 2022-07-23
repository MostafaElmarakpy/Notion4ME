import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/layout/workspace.dart';
import 'package:bmi_calculator/shared/blocobserver.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/login/Login_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey:"AIzaSyAWDDXlsdTjg8-otZpQjzylKO7gi7H0_uU",
        appId: "1:917191813759:android:7184e310a8261d9d576d4a",
        messagingSenderId: "917191813759",
        projectId: "notion4me-9d6a6",
      ));
  final db=FirebaseFirestore.instance;
  //db.settings = const Settings(persistenceEnabled: true);

  BlocOverrides.runZoned(
        () {
      // Use blocs..
    },
    blocObserver: MyBlocObserver(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print(email);
  runApp(
      MaterialApp( debugShowCheckedModeBanner: false,
          home: email == null ? LoginScreen() : workspace()));
}