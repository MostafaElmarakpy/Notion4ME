import 'package:bmi_calculator/modules/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


class Fire
{
  void userCreate({required String fname,
    required String lname,
    required String email,
    required String uid, required String image})
  {
    userModel use= userModel(
      fname: fname,
      lname: lname,
      email: email,
      image: "https://www.freepik.com/free-photo/emotional-bearded-male-has-surprised-facial-expression-astonished-look-dressed-white-shirt-with-red-braces-points-with-index-finger-upper-right-corner_10421016.htm#query=person&position=3&from_view=search",
    );
    FirebaseFirestore.instance.collection('users').doc(uid).set(
        use.toMap()
    );
  }
}