import 'dart:io';

import 'package:bmi_calculator/FireBase/stroeComponent.dart';
import 'package:bmi_calculator/modules/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../modules/login/Login_screen.dart';

class storePage {
  String name = "";
  String Pid ="";
  int Position = 0;
  List <storeComponent> components = [];
  storePage(String n, int s,String ss) {
    this.Pid=ss;
    this.name = n;
    this.Position = s;
  }

  Future<void> saveOnDB() async
  {
    final docRef = await FirebaseFirestore.instance.collection("users").doc(
        userModel.Uid).collection("Pages")
        .add({"name": this.name}).then((value) async
    {
      this.Pid = await value.id;
    });
  }

   Future <void> addComponent(storeComponent c) async {
    final docRef = await FirebaseFirestore.instance
        .collection("users").doc(userModel.Uid).collection("Pages")
        .doc(Pid).collection("Components").add(c.toMap()).then((value) async {
      c.id =await value.id;
      c.Pid = Pid;
      components.add(c);
    }
    );
  }

  Future<void> getAllComponents() async {
    final docRef = await FirebaseFirestore.instance
        .collection("users").doc(userModel.Uid).collection("Pages")
        .doc(Pid).collection("Components").orderBy("position");
    await docRef.get().then((res) async {
      //storeComponent c=storeComponent("",-1);
      for (int i = 0; i < res.docs.length; i++) {
        /*c.data=[];
          c.type=res.docs.elementAt(i).data()["type"];
          c.id=res.docs.elementAt(i).id;
          c.Pid=Pid;
          await c.getAllTxt();*/
        components.add(
            storeComponent(res.docs.elementAt(i).data()["type"], 0, res.docs
                .elementAt(i)
                .id, Pid));
        await components[i].getAllTxt();
      }
      print(this.components.length);
    }
    );
  }

  /*factory storePage.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,)
  {
    final data = snapshot.data();
    return storePage(
      name: data?['name'],
      num: data?['num'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
    };
  }*/
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'position': Position,
    };
  }
}