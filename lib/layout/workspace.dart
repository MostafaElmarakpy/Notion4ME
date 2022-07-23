import 'package:bmi_calculator/FireBase/ADD.dart';
import 'package:bmi_calculator/layout/checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../FireBase/getPage.dart';
import 'background.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'listbuilder.dart';

class workspace extends StatelessWidget {

  String? NAMe;
  String s='mazen';
  List<page>pageComponents=[page(x: 0,),];
  List<TextButton>pageName=[];
  int counter =0;
  int cc=0;
  int ccc=0;
  workspace({String ?name="workspace Notion 4MI"})
   {
    this.NAMe=name;
  }
  TextEditingController c = TextEditingController();
  TextEditingController a = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => backgroundCubit(),
      child: BlocConsumer<backgroundCubit, Backgroundstates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            backgroundCubit.get(context).getter(this);
          if(counter==0)  backgroundCubit.get(context).addfirstpage(this);
          if(cc==0) backgroundCubit.get(context).cap_pages(this);
          //if(ccc==0) backgroundCubit.get(context).txtBut(this);
            return Scaffold(
              //new drawer
              drawer: Drawer(
                backgroundColor: Colors.black87,
                child: Column(
                  children: [
                    SizedBox(height: 50.0,),
                    Row(
                        children: [
                          TextButton(
                            child :Row(
                              children: [
                                Icon( Icons.add),
                                Text('addPage'),
                              ],
                            ),
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (cont) {
                                    return AlertDialog(
                                      title: Text(
                                        'add name of the page',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.black87,
                                      actions: [
                                        TextFormField(
                                          controller: c,
                                          style: TextStyle(
                                            color: Colors.white,),
                                          keyboardType: TextInputType.text,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.text_fields_outlined,
                                              color: Colors.white,
                                            ),
                                            border: InputBorder.none,

                                          ),
                                          onFieldSubmitted: (value){
                                            backgroundCubit.get(context).addPage(c.text,this);
                                            Navigator.pop(cont);
                                          },
                                        )
                                      ],
                                    );
                                  });

                            },
                          ),
                          SizedBox(width: 70.0,),
                          TextButton(
                            child :Row(
                              children: [
                                Icon( Icons.delete_outline),
                                Text('deletePage'),
                              ],
                            ),
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (cont) {
                                    return AlertDialog(
                                      title: Text(
                                        'insert name of the page u wanna delete',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.black87,
                                      actions: [
                                        TextFormField(
                                          controller: a,
                                          style: TextStyle(
                                            color: Colors.white,),
                                          keyboardType: TextInputType.text,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.text_fields_outlined,
                                              color: Colors.white,
                                            ),
                                            border: InputBorder.none,

                                          ),
                                          onFieldSubmitted: (value){
                                            backgroundCubit.get(context).deletePage(a.text,this);
                                            Navigator.pop(cont);
                                          },
                                        )
                                      ],
                                    );
                                  });

                            },
                          ),
                        ]),

                    Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(5),
                          itemCount: pageName.length,
                          itemBuilder: (BuildContext contex, int index) {
                            return pageName[index];
                          }),
                    ),
                  ],
                ),
              ),
              appBar: AppBar(
                title: Text(
                  ' $NAMe',
                  maxLines: null,
                  style: TextStyle(color: Colors.black87),
                ),
                actions: [
                  IconButton(
                    iconSize: 20.0,
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                    ),
                  ),
                  IconButton(
                    iconSize: 20.0,
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notification_important_outlined,
                    ),
                  ),
                ],
              ),
              body:pageComponents[globalpagenum]
              ,
            );
          }),
    );
  }
}
