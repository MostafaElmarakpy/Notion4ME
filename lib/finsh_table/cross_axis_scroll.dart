import 'package:bmi_calculator/layout/cubit/cubit.dart';
import 'package:bmi_calculator/layout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../layout/listbuilder.dart';
import 'lab1_controller.dart';

class CrossAxisScroll extends StatelessWidget {
  int indexC=2;
  int indexR=2;
  int pos =0;
  Color c =Colors.white;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<backgroundCubit, Backgroundstates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return  SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [

                Row(
                  children: [
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
                                                    position = pos;
                                                    backgroundCubit.get(context).addTextForm();
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
                                                    backgroundCubit.get(context).addTextForm();
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
                    Expanded(
                        flex: 9,
                        child: _wrap(context, GetBuilder<Lab1Controller>(
                          init: Lab1Controller(),
                          builder: (controller) => SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: DataTable(
                                    dataRowColor: MaterialStateColor.resolveWith( (Set<MaterialState> states)
                                    => states.contains(MaterialState.selected)
                                        ? Colors.blue
                                        : Color.fromARGB(40, 215, 217, 219)
                                    ),

                                    horizontalMargin: 2,
                                    columnSpacing: 5,

                                    columns:  List.generate(
                                      indexC,
                                          (index) => DataColumn(

                                          label:
                                          Expanded(
                                            child: Center(
                                              child: SizedBox(
                                                width: 170,
                                                height: 40,

                                                child: TextFormField(

                                                  textAlign: TextAlign.center,

                                                  autofocus: true,

                                                  controller: TextEditingController(text: controller.xAxisNames[index] ?? ''),

                                                  onChanged: (text) {
                                                    controller.xAxisNames[index] = text;
                                                  },
                                                  style: TextStyle(
                                                    color: c,

                                                  ),
                                                  keyboardType: TextInputType.text,
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                ),

                                              ),
                                            ),)
                                      ),
                                    ),
                                    rows:  List.generate(
                                      //alganb
                                      indexR,
                                          (rowIndex) => DataRow(
                                        cells:
                                        List.generate(
                                          indexC,//
                                              (cellIndex) => DataCell(

                                            //
                                            TextFormField(
                                              autofocus: true,
                                              controller: TextEditingController(text: controller.yAxisNames[rowIndex] ?? ''),
                                              style: TextStyle(
                                                color: c,

                                              ),
                                              onChanged: (String value) {
                                                controller.updateText(rowIndex, cellIndex , value);
                                                 print("data $rowIndex-$cellIndex");

                                              },
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                // hintText: 'Row ${rowIndex + 1}',
                                                isDense: true,
                                                labelText: "data $cellIndex-$rowIndex",
                                              ),
                                            ),

                                            onDoubleTap: (){
                                              print ("onDoubleTap");
                                              //setState(() {indexR--;});
                                            },
                                            onLongPress:  (){
                                              print ("onLongPress");
                                            },

                                          ),
                                        ),



                                      ),
                                    ),
                                    //border: TableBorder.all(color: Colors.grey),
                                  ),
                                ),
                              ),
                        )


                        )),
                    Expanded(
                        flex: 1,
                        child:  Container(
                          height: 200,
                          child: ListTile(
                            title:
                            Center(child: Icon(Icons.add)),
                            autofocus: true,

                            onTap: () {
                              position=pos;
                              backgroundCubit.get(context).addcolumn();

                              //CounterCubit.get(context).change(true);
                              //  setState(() {indexC++;});
                            },

                          ),
                        )




                    ),
                  ],
                ),

                ListTile(
                  //minLeadingWidth: 20,
                  title: Icon(Icons.add),
                  onTap: () {
                    position=pos;
                    backgroundCubit.get(context).addrow();
                    // setState(() {indexR++;});
                  },
                  autofocus: true,

                ),

              ],
            ),
          );


        }
    );
  }


  Widget _wrap(BuildContext context, Widget widget) {
    return Container(
      child: widget,
      height: 200,
      // width: MediaQuery.of(context).size.width,
      width: 500,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
       // border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }
}


