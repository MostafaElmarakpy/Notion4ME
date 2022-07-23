import 'package:bmi_calculator/FireBase/storePage.dart';
import 'package:bmi_calculator/modules/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
class getPages
{
  List <storePage> Pages=[];
  Future<void> getAllPages()
  async {
    final docRef =await FirebaseFirestore.instance
        .collection("users").doc(userModel.Uid).collection("Pages");
    await docRef.orderBy("position").get().then((res)
      async {

      for(int i=0;i<res.docs.length;i++)
        {
          this.Pages.add(storePage(res.docs.elementAt(i).data()["name"],
               res.docs.elementAt(i).data()["position"],res.docs.elementAt(i).id));
          await Pages.elementAt(i).getAllComponents();
        }

    }
    );
  }
}