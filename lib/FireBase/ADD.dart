import 'package:bmi_calculator/FireBase/storePage.dart';
import 'package:bmi_calculator/FireBase/stroeComponent.dart';
import 'package:bmi_calculator/modules/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ADD
{
  Future<storePage> AddPage(String name,int po)
  async {
    storePage p=storePage(name,po,"");
    final  docRef = await FirebaseFirestore.instance
        .collection("users").doc(userModel.Uid).collection("Pages")
        .add(p.toMap()).then((value) => {p.Pid=value.id});
    return p;
  }
}
