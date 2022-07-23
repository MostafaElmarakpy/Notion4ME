import 'package:bmi_calculator/layout/bulleted.dart';
import 'package:bmi_calculator/layout/cubit/cubit.dart';
import 'package:bmi_calculator/layout/cubit/states.dart';
import 'package:bmi_calculator/layout/listbuilder.dart';
import 'package:bmi_calculator/layout/numberdlist.dart';
import 'package:bmi_calculator/layout/textform.dart';
import 'package:bmi_calculator/layout/togglelist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'checkbox.dart';

class page extends StatelessWidget {
  List<Widget> liswid = [];
  String NAMe="";
  int pageNum=0;
  String id="";
  page({String name="page Notion 4MI",int x=0,String i=""})
  {this.NAMe=name;this.pageNum=x;this.id=i;}
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<backgroundCubit, Backgroundstates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Container(
                      decoration: BoxDecoration(
                        color: backGroundColor,
                      ),
                      child: Column(
                          children: [
                        Expanded(
                          child: ListView.builder(
                              padding: const EdgeInsets.all(5),
                              itemCount: liswid.length,
                              itemBuilder: (BuildContext context, int index) {
                                return liswid[index];
                              }),
                        ),
                        Center(
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black45,
                                      child: IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (cont) {
                                                return AlertDialog(
                                                  title: Text(
                                                    'Select Component U Wanna add',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  backgroundColor:
                                                      Colors.black87,
                                                  actions: [
                                                    SingleChildScrollView(
                                                        scrollDirection: Axis.horizontal,
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5.0),
                                                              child:
                                                                  CircleAvatar(backgroundColor: Colors.black45,
                                                                child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(cont);
                                                                    backgroundCubit.get(context).addTextFormatend(this);
                                                                  },
                                                                        icon: const Icon(Icons.text_fields_outlined),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5.0),
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                child:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(cont);
                                                                    backgroundCubit.get(context).addcheckboxatend(this);
                                                                  },
                                                                      icon: const Icon(Icons.check_box),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(5.0),
                                                              child: CircleAvatar(
                                                                backgroundColor: Colors.black45,
                                                                child:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(cont);
                                                                    backgroundCubit.get(context).addbulletedatend(this);
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .format_list_bulleted),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5.0),
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                child:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(cont);
                                                                    backgroundCubit.get(context).addtoggleListatend(this);
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .legend_toggle_outlined),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5.0),
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                child:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(cont);
                                                                    backgroundCubit.get(context).addnumberdListItematend(this);
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .format_list_numbered_outlined),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5.0),
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .black45,
                                                                child:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(cont);
                                                                    backgroundCubit.get(context).addtableend(this);
                                                                  },
                                                                     icon: const Icon(Icons.table_rows_outlined),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ],
                                                );
                                              });
                                          // insertintoDB("m4mazoma");
                                          // backgroundCubit.get(context).users=await GetDataFromDB(database);
                                          // print(  backgroundCubit.get(context).users );
                                        },
                                        icon: const Icon(Icons.add_box_outlined),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black45,
                                      child: IconButton(
                                        onPressed: () {
                                          backgroundCubit.get(context).deleteComponentatend(this);
                                        },
                                        icon: const Icon(Icons.delete_outline),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black45,
                                      child: IconButton(
                                        onPressed: () {
                                          int q = 0;
                                          q = liswid.length - 1;
                                          for (int i = 0; i < liswid.length; i++) {
                                            //liswid[i].pos = x--;
                                            if(liswid[i] is TextForm ){
                                              var x = liswid[i] as TextForm ;
                                              x .pos = q--;
                                            }
                                            if(liswid[i] is bullted ){
                                              var x = liswid[i] as bullted ;
                                              x .pos =  q--;
                                            }
                                            if(liswid[i] is checkbox ){
                                              var x = liswid[i] as checkbox ;
                                              x .pos =  q--;
                                            }
                                            if(liswid[i] is NumberdList ){
                                              var x = liswid[i] as NumberdList ;
                                              x .pos =  q--;
                                            }
                                            if(liswid[i] is toggleList ){
                                              var x = liswid[i] as toggleList ;
                                              x .pos =  q--;
                                            }
                                            // #add conditions for table and calender , image , audio , voice , video#
                                          }
                                          backgroundCubit.get(context).reversed(this);
                                        },
                                        icon: const Icon(Icons.repeat),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black45,
                                      child: IconButton(
                                        onPressed: () {
                                          backgroundCubit.get(context).favoritWS();
                                        },
                                        icon: Icon(favoritePage),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black45,
                                      child: IconButton(
                                        onPressed: () {
                                          backgroundCubit.get(context).pdfWS();
                                        },
                                        icon: Icon(printingWSasPDF),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black45,
                                      child: IconButton(
                                        onPressed: () {
                                          backgroundCubit.get(context).mode();
                                        },
                                        icon: Icon(lightMood),
                                      ),
                                    ),
                                  ),
                                ])))
                      ]));
            });
  }
}

late Database database;
Future insertintoDB(String name) async {
  return database.transaction((txn) {
    return txn
        .rawInsert('INSERT INTO users(name)VALUES("$name") ')
        .then((value) {
      print("$value inserted successfully");
    }).catchError((error) {
      print('error when insert table${error.toString()}');
    });
  });
}

Future<List<Map>> GetDataFromDB(database) async {
  return await database.rawQuery('SELECT * FROM users');
}

void deletefromDB() {}

void updateDB() {}



