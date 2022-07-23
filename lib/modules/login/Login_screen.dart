import 'package:bmi_calculator/FireBase/getPage.dart';
import 'package:bmi_calculator/FireBase/storePage.dart';
import 'package:bmi_calculator/FireBase/storeTxt.dart';
import 'package:bmi_calculator/layout/workspace.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../FireBase/stroeComponent.dart';

import '../userModel.dart';
import 'register.dart';
userModel myUser=userModel(fname: "",lname: "",email: "",image: "");
class LoginScreen extends StatelessWidget {
  var emailC= TextEditingController();
  var passC= TextEditingController();
  final auth= FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text(
                    "Welcome to Notion 4me",
                    style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold ,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // ignore: prefer_const_constructors
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: emailC,
                    decoration:InputDecoration(
                      labelText: 'email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      enabledBorder: OutlineInputBorder
                        (
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ) ,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {

                        return 'email can not be null';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passC,
                    obscureText: true,
                    decoration:InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      enabledBorder: OutlineInputBorder
                        (
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ) ,

                    keyboardType: TextInputType.emailAddress,
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'pass can not be null';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text('Sign in'),
                        onPressed:()
                        async {

                          if(_formKey.currentState!.validate())
                          {
                            auth.signInWithEmailAndPassword(
                              email: emailC.text,
                              password: passC.text,
                            ).then((value)  async {
                              //final prefs = await SharedPreferences.getInstance();
                              //prefs.setString('email', emailC.text);
                              myUser.setid(value.user!.uid);
                              Navigator.push(context,
                                  MaterialPageRoute(builder:(context)=> workspace() ));

                               /*final docRef = FirebaseFirestore.instance.collection("users").doc(myUser.getid()).collection("Pages")
                                   .withConverter(
                                 fromFirestore: storePage.fromFirestore,
                                 toFirestore: (storePage s, options) => s.toFirestore(),
                               ).doc("dsadsddda");
                                docRef.set(storePage(name: "dss", num: 1));
                                storePage s=storePage("hiiiii");
                                await s.saveOnDB();
                                storeComponent c=storeComponent("5ra", 455);
                                await s.addComponent(c);
                                await c.addData(storeTxt(txt:"sdasdsadsa",fontColor: 1,fontSize: 24,fontWeight: "dsa",row: -1,colm: -1));
                              final docRef =await FirebaseFirestore.instance
                                  .collection("users").doc(userModel.Uid).collection("Pages").doc(s.Pid)
                                  .collection("Components").doc(s.components.first.id).collection("text");
                              docRef.get().then(
                                    ( res) {
                                  final data =   res.docs.first.data() ;//res list (for loop )
                                  print(data);
                                },
                                onError: (e) => print("Error getting document: $e"),
                              );*/
                              getPages allP=getPages();
                              //await allP.getAllPages();
                             // print(await allP.Pages.elementAt(0).components.first.data.first.txt);
                            });

                          }

                        }
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text(
                        "don't have an account?",
                      ),
                      TextButton(
                        onPressed: ()
                        {
                          Navigator.push(context,
                              MaterialPageRoute(builder:(context)=> RegisterScreen() )
                          );
                        },
                        child: Text(
                          'REGISTER NOW',
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}