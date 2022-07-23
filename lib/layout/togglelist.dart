import 'package:bmi_calculator/layout/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'checkbox.dart';
import 'package:bmi_calculator/layout/cubit/cubit.dart';
import 'package:bmi_calculator/layout/cubit/states.dart';
import 'listbuilder.dart';
class toggleList extends StatelessWidget {
  @override
  TextEditingController mainText = TextEditingController();
  List<Widget> togglelst = [];
  FontWeight fw=FontWeight.normal;
  FontStyle fs=FontStyle.normal;
  TextDecoration td =TextDecoration.none;
  double fsize= 16.0;
  int i =0;
  Color c =Colors.white;
  int pos=0;
  Widget build(BuildContext context) {
    return BlocConsumer<backgroundCubit,Backgroundstates>(
      listener:(context,state){} ,
      builder: (context,state){
        return  Column(
          children: [
            ExpansionTile(
              title: Row(
                children: [
                  //toAdd
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (cont) {
                              return AlertDialog(
                                title: Text(
                                  'Select Component U Wanna add',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.black87,
                                actions: [
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.black45,
                                              child:
                                              IconButton(
                                                onPressed:
                                                    () {
                                                  Navigator.pop(cont);
                                                  position=pos;
                                                  backgroundCubit.get(context).addTextFormatendintoggle();
                                                  print("ana el position , sa7by .. {$pos}");
                                                },
                                                icon: const Icon(Icons.text_fields_outlined),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child:
                                            CircleAvatar(
                                              backgroundColor: Colors.black45,
                                              child:
                                              IconButton(
                                                onPressed:
                                                    () {
                                                  Navigator.pop(cont);
                                                  position=pos;
                                                  backgroundCubit.get(context).addBulleted();
                                                },
                                                icon: const Icon(Icons.format_list_bulleted),
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
                                                  position=pos;
                                                  backgroundCubit.get(context).addcheckBox();
                                                },
                                                icon: const Icon(Icons.check_box),
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
                                                  backgroundCubit.get(context).addTextForm();
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
                                                  backgroundCubit.get(context).addTextForm();
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
                                                  backgroundCubit.get(context).addtable();
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
                      icon:
                      const Icon(Icons.add_box_outlined),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (cont) {
                              return AlertDialog(
                                title: Text(
                                  'Select Feature U Wanna put on Text',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.black87,
                                actions: [
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.black45,
                                              child:
                                              IconButton(
                                                onPressed:
                                                    () {
                                                  position=pos;
                                                  backgroundCubit.get(context).modifyTxetToBold(fw);
                                                  Navigator.pop(cont);
                                                },
                                                icon: const Icon(Icons.format_bold_outlined),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(5.0),
                                            child:
                                            CircleAvatar(
                                              backgroundColor: Colors.black45,
                                              child:
                                              IconButton(
                                                onPressed:
                                                    () {
                                                  position=pos;
                                                  Navigator.pop(cont);
                                                  backgroundCubit.get(context).modifyTxetToItalic(fs);
                                                },
                                                icon: const Icon(Icons.format_italic_outlined),
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
                                                  position=pos;
                                                  Navigator.pop(cont);
                                                  backgroundCubit.get(context).modifyTxetToUnderLine(td);
                                                },
                                                icon: const Icon(Icons.format_underline_outlined),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(5.0),
                                            child:
                                            CircleAvatar(
                                              backgroundColor:
                                              Colors.black45,
                                              child:
                                              IconButton(
                                                onPressed:
                                                    () {
                                                  position=pos;
                                                  Navigator.pop(cont);
                                                  ++i;if(i>=6)i=0;
                                                  backgroundCubit.get(context).changeColor(c,i);
                                                },
                                                icon: const Icon(Icons.color_lens_outlined),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets
                                                .all(5.0),
                                            child:
                                            CircleAvatar(
                                              backgroundColor: Colors.black45,
                                              child:
                                              IconButton(
                                                onPressed:
                                                    () {
                                                  position=pos;
                                                  backgroundCubit.get(context).changesizeUp(fsize);
                                                },
                                                icon: const Icon(Icons.arrow_circle_up_outlined),
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
                                                  position=pos;
                                                  backgroundCubit.get(context).changesizeDown(fsize);
                                                },
                                                icon: const Icon(Icons.arrow_circle_down_outlined),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets
                                                .all(5.0),
                                            child:
                                            CircleAvatar(
                                              backgroundColor: Colors.black45,
                                              child:
                                              IconButton(
                                                onPressed:
                                                    () {
                                                  position=pos;
                                                  Navigator.pop(cont);
                                                  backgroundCubit.get(context).deleteTextForm();
                                                },
                                                icon: const Icon(Icons.delete_outline),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              );
                            });
                      },
                      icon: Icon(
                        Icons.menu_open_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                    child:  TextFormField(
                      style: TextStyle(
                        color: c,
                        fontWeight: fw,
                        fontStyle: fs,
                        decoration: td,
                        fontSize:fsize,
                      ),
                      onFieldSubmitted: (value) {
                        position = pos;
                        backgroundCubit.get(context).addTextForm();
                      },
                      controller: mainText,
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.text_fields_outlined,
                          color: Colors.grey,
                        ),
                        labelText: "textForm",
                        labelStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),),
                ],
              ),
                    children:[

                       Container(
                           height:double.maxFinite,
                          child: ListView.builder(
                              padding: const EdgeInsets.all(5),
                              itemCount: togglelst.length,
                              itemBuilder: (BuildContext context, int index) {
                                return togglelst[index];
                              }),

                        ),

                    ]
            ),
          ],
        );
      },
    );
  }

}

