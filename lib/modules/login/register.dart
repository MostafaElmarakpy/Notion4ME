import 'dart:io';


import 'package:bmi_calculator/modules/login/Login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';


import 'Firebasee.dart';
class RegisterScreen extends StatelessWidget {
  var first= TextEditingController();
  var last= TextEditingController();
  var email= TextEditingController();
  var pass= TextEditingController();
  var pass2= TextEditingController();
  final GlobalKey<FormState> formKey= GlobalKey<FormState>();
  final auth= FirebaseAuth.instance;
  Fire f=Fire();
  File? image;
  var picker=ImagePicker();
  Future<void> getImage() async
  {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if(pickedFile!=null)
    {
      image= File(pickedFile.path);
    }
    else{
      print("no image selected");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Container(
                margin: EdgeInsets.fromLTRB(1, 60, 0,0),
                child: Text(
                  "Welcome to Notion 4me",
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold ,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children:
                                  [
                                    CircleAvatar(
                                      radius: 41,
                                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage('https://www.freepik.com/free-icon/user_15486708.htm#query=default%20profile&position=2&from_view=search'),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: (){},
                                      icon: CircleAvatar(
                                        radius: 20,

                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 16.0,
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ]
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: first,
                          decoration:InputDecoration(
                            labelText: 'First Name',
                            hintText: 'Enter your first name',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.person,
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
                              return 'First Name can not be null';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: last,
                          decoration:InputDecoration(
                            labelText: 'Last Name',
                            hintText: 'Enter your Last name',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.person,
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
                              return 'Last Name can not be null';

                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: email,
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
                          controller: pass,
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
                              return 'Password can not be null';
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child:
                              Text(
                                "Sign up",
                              ),
                              onPressed:()
                              {
                                if(formKey.currentState!.validate())
                                {
                                  auth.createUserWithEmailAndPassword
                                    (
                                    email: email.text,
                                    password: pass.text,
                                  ).then((value)
                                  {
                                    f.userCreate(
                                      fname: first.text,
                                      lname: last.text,
                                      email: email.text,
                                      uid:value.user!.uid,
                                      image: "",
                                    );
                                  }).catchError((error){
                                    print("error");
                                  });
                                  Navigator.push(context,
                                      MaterialPageRoute(builder:(context)=> LoginScreen() )
                                  );
                                }
                              }

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}