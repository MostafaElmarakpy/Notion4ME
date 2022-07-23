import 'package:bmi_calculator/FireBase/firebaseEditor.dart';
import 'package:bmi_calculator/FireBase/storePage.dart';
import 'package:bmi_calculator/FireBase/storeTxt.dart';
import 'package:bmi_calculator/FireBase/stroeComponent.dart';
import 'package:bmi_calculator/layout/background.dart';
import 'package:bmi_calculator/layout/checkbox.dart';
import 'package:bmi_calculator/layout/cubit/states.dart';
import 'package:bmi_calculator/layout/listbuilder.dart';
import 'package:bmi_calculator/layout/numberdlist.dart';
import 'package:bmi_calculator/layout/textform.dart';
import 'package:bmi_calculator/layout/togglelist.dart';
import 'package:bmi_calculator/modules/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../FireBase/ADD.dart';
import '../../finsh_table/cross_axis_scroll.dart';
import '../bulleted.dart';
import '../workspace.dart';
class backgroundCubit extends Cubit<Backgroundstates>{
  backgroundCubit() : super(Backgroundinitialstates());
  static backgroundCubit get(context)=>BlocProvider.of(context);
  List<Map> users = [];
   var m ;
   workspace getter(workspace w){m=w;return w;}

  void addTextForm() {

       m.pageComponents[globalpagenum].liswid.insert(position + 1, TextForm());
        var x = m.pageComponents[globalpagenum] .liswid[position + 1] as TextForm;
        x.pos=position+1 ;

        for (int i = position + 2; i < m.pageComponents[globalpagenum] .liswid.length; i++) {
          if(m.pageComponents[globalpagenum] .liswid[i] is TextForm ){
            var x = m.pageComponents[globalpagenum] .liswid[i] as TextForm ;
            x .pos += 1;
          }
          if(m.pageComponents[globalpagenum] .liswid[i] is bullted ){
            var x = m.pageComponents[globalpagenum] .liswid[i] as bullted ;
            x .pos += 1;
          }
          if(m.pageComponents[globalpagenum] .liswid[i] is checkbox ){
            var x = m.pageComponents[globalpagenum] .liswid[i] as checkbox ;
            x .pos += 1;
          }
          if(m.pageComponents[globalpagenum] .liswid[i] is NumberdList ){
            var x = m.pageComponents[globalpagenum] .liswid[i] as NumberdList ;
            x .pos += 1;
          }
          if(m.pageComponents[globalpagenum] .liswid[i] is toggleList ){
            var x = m.pageComponents[globalpagenum] .liswid[i] as toggleList ;
            x .pos += 1;
          }
          // #add conditions for table and calender , image , audio , voice , video#
        }
    emit(BackgroundaddTextFormstate());
  }
  void addBulleted(){

    m.pageComponents[globalpagenum] .liswid.insert(position + 1, bullted());
    var x = m.pageComponents[globalpagenum] .liswid[position + 1] as bullted;
    x.pos=position+1 ;

    for (int i = position + 2; i < m.pageComponents[globalpagenum] .liswid.length; i++) {
      if(m.pageComponents[globalpagenum] .liswid[i] is TextForm ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as TextForm ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is bullted ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as bullted ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is checkbox ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as checkbox ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is NumberdList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as NumberdList ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is toggleList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as toggleList ;
        x .pos += 1;
      }
      // #add conditions for table and calender , image , audio , voice , video#
    }
    emit(addBulletedat());
  }
  void addcheckBox(){


     m.pageComponents[globalpagenum] .liswid.insert(position + 1, checkbox());
    var x = m.pageComponents[globalpagenum] .liswid[position + 1] as checkbox;
    x.pos=position+1 ;
    for (int i = position + 2; i <m.pageComponents[globalpagenum] . liswid.length; i++) {
      if(m.pageComponents[globalpagenum] .liswid[i] is TextForm ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as TextForm ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is bullted ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as bullted ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is checkbox ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as checkbox ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is NumberdList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as NumberdList ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is toggleList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as toggleList ;
        x .pos += 1;
      }
      // #add conditions for table and calender , image , audio , voice , video#
    }
    emit(addcheckBoxat());
  }
  void naviVal(bool value){

    var x =m.pageComponents[globalpagenum] .liswid[position] as checkbox;
    x.val =value;
    x.td=TextDecoration.lineThrough;
    emit(Backgroundcheckboxeditvalstate());
  }
  void addnumberdListItem(){

    m.pageComponents[globalpagenum] . liswid.insert(position + 1, NumberdList());
    var x = m.pageComponents[globalpagenum] .liswid[position + 1] as NumberdList;
    x.pos=position+1 ;
    if(m.pageComponents[globalpagenum] .liswid[position] is NumberdList) {
      var y = m.pageComponents[globalpagenum] .liswid[position] as NumberdList;
      x.num=y.num+1;
    }
    for (int i = position + 2; i <m.pageComponents[globalpagenum] . liswid.length; i++) {
      if(m.pageComponents[globalpagenum] .liswid[i] is NumberdList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as NumberdList ;
        x .num += 1;
      }
      else break;
    }
    for (int i = position + 2; i < m.pageComponents[globalpagenum] .liswid.length; i++) {
      if(m.pageComponents[globalpagenum] .liswid[i] is TextForm ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as TextForm ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is bullted ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as bullted ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is checkbox ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as checkbox ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is NumberdList ){
        var x =m.pageComponents[globalpagenum] . liswid[i] as NumberdList ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is toggleList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as toggleList ;
        x .pos += 1;
      }
      // #add conditions for table and calender , image , audio , voice , video#
    }
    emit(addnumberdListItemat());
  }
  void deleteTextForm()  {

      if (position == m.pageComponents[globalpagenum] .liswid.length) {
        m.pageComponents[globalpagenum] . liswid.removeAt(
            m.pageComponents[globalpagenum] .liswid.length - 1);
      }
      else {
        m.pageComponents[globalpagenum] . liswid.removeAt(position);
      }

    for (int i = position; i < m.pageComponents[globalpagenum] .liswid.length; i++) {
      if(m.pageComponents[globalpagenum] .liswid[i] is TextForm ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as TextForm ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is bullted ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as bullted ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is checkbox ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as checkbox ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is NumberdList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as NumberdList ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is toggleList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as toggleList ;
        x .pos -= 1;
      }
      // #add conditions for table and calender , image , audio , voice , video#
    }
    emit(BackgrounddeleteTextFormstate());
  }
  Future<void> deleteBulleted() async {
    var x=m.pageComponents[globalpagenum].liswid[position] as bullted;
    if (position == m.pageComponents[globalpagenum] .liswid.length) {
      m.pageComponents[globalpagenum] . liswid.removeAt(m.pageComponents[globalpagenum] .liswid.length - 1);
    }
    else {
      m.pageComponents[globalpagenum] . liswid.removeAt(position);
    }

    for (int i = position; i < m.pageComponents[globalpagenum] .liswid.length; i++) {
      if(m.pageComponents[globalpagenum] .liswid[i] is TextForm ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as TextForm ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is bullted ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as bullted ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is checkbox ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as checkbox ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is NumberdList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as NumberdList ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is toggleList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as toggleList ;
        x .pos -= 1;
      }
      // #add conditions for table and calender , image , audio , voice , video#
    }
    print("pid");
    print(m.pageComponents[globalpagenum].id);
    print("cid");
    print(x.Cid);
    print("id");
    print(x.id);
    print("start position ");
    print(x.pos);
    final docRef =await FirebaseFirestore.instance
        .collection("users")
        .doc(userModel.Uid)
        .collection("Pages")
        .doc(m.pageComponents[globalpagenum].id).collection("Components").doc(x.Cid);
    await docRef.collection("text").doc(x.id).delete();
    await docRef.delete();
    firebaseEditor e=firebaseEditor(m.pageComponents[globalpagenum].id, x.Cid, x.id);
    e.editPositionsOfComp(from:x.pos,to:10000,value:-1);
    emit(BackgrounddeleteBulletedstate());
  }
  Future <void> deletecheckBox() async {
    var x=m.pageComponents[globalpagenum].liswid[position] as checkbox;
    if (position == m.pageComponents[globalpagenum] .liswid.length) {
      m.pageComponents[globalpagenum] .  liswid.removeAt(m.pageComponents[globalpagenum] .liswid.length - 1);
    }
    else {

      m.pageComponents[globalpagenum] . liswid.removeAt(position);
      print(position);
    }

    for (int i = position; i < m.pageComponents[globalpagenum] .liswid.length; i++) {
      if(m.pageComponents[globalpagenum] .liswid[i] is TextForm ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as TextForm ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is bullted ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as bullted ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is checkbox ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as checkbox ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is NumberdList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as NumberdList ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is toggleList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as toggleList ;
        x .pos -= 1;
      }
      // #add conditions for table and calender , image , audio , voice , video#
    }
    print("pid");
    print(m.pageComponents[globalpagenum].id);
    print("cid");
    print(x.Cid);
    print("id");
    print(x.id);
    print("start position ");
    print(x.pos);
    final docRef =await FirebaseFirestore.instance
        .collection("users")
        .doc(userModel.Uid)
        .collection("Pages")
        .doc(m.pageComponents[globalpagenum].id).collection("Components").doc(x.Cid);
    await docRef.collection("text").doc(x.id).delete();
    await docRef.delete();
    firebaseEditor e=firebaseEditor(m.pageComponents[globalpagenum].id, x.Cid, x.id);
    e.editPositionsOfComp(from:x.pos,to:10000,value:-1);
    emit(BackgrounddeletecheckBoxstate());
  }
  void deletenumberdListItem() {

    if (position == m.pageComponents[globalpagenum] .liswid.length) {
      m.pageComponents[globalpagenum] . liswid.removeAt(m.pageComponents[globalpagenum] .liswid.length - 1);
    }
    else {
      m.pageComponents[globalpagenum] . liswid.removeAt(position);
    }
    for (int i = position ; i < m.pageComponents[globalpagenum] .liswid.length; i++) {
      if(m.pageComponents[globalpagenum] .liswid[i] is NumberdList ){
        var x =m.pageComponents[globalpagenum] . liswid[i] as NumberdList ;
        x .num -= 1;
      }
      else break;
    }
    for (int i = position; i < m.pageComponents[globalpagenum] .liswid.length; i++) {
      if(m.pageComponents[globalpagenum] .liswid[i] is TextForm ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as TextForm ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is bullted ){
        var x =m.pageComponents[globalpagenum] . liswid[i] as bullted ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is checkbox ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as checkbox ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is NumberdList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as NumberdList ;
        x .pos -= 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is toggleList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as toggleList ;
        x .pos -= 1;
      }
      // #add conditions for table and calender , image , audio , voice , video#
    }
    emit(BackgrounddeletedeletenumberdListItemstate());
  }
  Future<void> addTextFormatend(page p) async {
    p.liswid.add(TextForm());
    var xx=p.liswid.last as TextForm;
    storeComponent c=storeComponent("TextForm",p.liswid.length-1,xx.id, p.id);
    storeTxt txtaaa=storeTxt(txt: xx.mainText.text,
        fontColor: xx.i,
        fontSize: xx.fsize,
        id: xx.id, fontWeight: xx.fw.toString(), colm: -1, row: -1);
    await myPages.Pages[p.pageNum].addComponent(c);
    await c.addData(txtaaa) ;
    xx.id=txtaaa.id;
    xx.Cid=c.id;
    xx.Pid=c.Pid;
    if(p .liswid.last is TextForm ){
      var x=p .liswid.last as TextForm;
      x.pos=m.pageComponents[globalpagenum] .liswid.length-1;
    }
    emit(BackgroundaddComponentatendstate());
  }
  Future<void> addbulletedatend(page p) async {
    p .liswid.add(bullted(poss: p.liswid.length-1,));
    var xx=p.liswid.last as bullted;
    storeComponent c=storeComponent("Bullted",p.liswid.length-1,xx.id, p.id);
    storeTxt txtaaa=storeTxt(txt: xx.mainText.text,
        fontColor: xx.i,
        fontSize: xx.fsize,
        id: xx.id, fontWeight: xx.fw.toString(), colm: -1, row: -1);
    await myPages.Pages[p.pageNum].addComponent(c);
    await c.addData(txtaaa) ;
    xx.id=txtaaa.id;
    xx.Cid=c.id;
    xx.Pid=c.Pid;
    if(p.liswid.last is bullted ){
      var x=p .liswid.last as bullted;
      x.pos=p .liswid.length-1;
    }
    emit(Backgroundaddbulletedatendstate());
  }
  Future<void> addcheckboxatend(page p) async {
    p .liswid.add(checkbox(p:p.liswid.length-1));
    var xx=p.liswid.last as checkbox;
    storeComponent c=storeComponent("CheckBox",p.liswid.length-1,xx.id, p.id);
    storeTxt txtaaa=storeTxt(txt: xx.mainText.text,
        fontColor: xx.i,
        fontSize: xx.fsize,
        id: xx.id, fontWeight: xx.fw.toString(), colm: -1, row: -1);
    await myPages.Pages[p.pageNum].addComponent(c);
    await c.addData(txtaaa) ;
    xx.id=txtaaa.id;
    xx.Cid=c.id;
    xx.Pid=c.Pid;
    if(p.liswid.last is checkbox ){
      var x=p .liswid.last as checkbox;
      x.pos=p .liswid.length-1;
    }
    emit(Backgroundaddcheckboxatendstate());
  }
  void addnumberdListItematend(page p){
   p .liswid.add(NumberdList());
    if(p.liswid.last is NumberdList ){
      var x=p.liswid.last as NumberdList;
      x.pos=p.liswid.length-1;
    }
    emit(BackgroundaddnumberdListItematendstate());
  }
  Future<void> deleteComponentatend(page p) async {
    var x;
     if(p.liswid.last is TextForm )
       {
          x=p.liswid.last as TextForm ;
       }
      else if(p.liswid.last is checkbox)
       {
          x=p.liswid.last as checkbox ;
       }
      else if(p.liswid.last is bullted)
       {
          x=p.liswid.last as bullted ;
       }
    final docRef =await FirebaseFirestore.instance
        .collection("users")
        .doc(userModel.Uid)
        .collection("Pages")
        .doc(p.id ).collection("Components").doc(x.Cid);
        docRef.collection("text").doc(x.id).delete();
        docRef.delete();
        p .liswid.removeAt(
        p.liswid.length-1,
    );
    emit(BackgrounddeleteComponentatendstate());
  }
  void modifyTxetToBold(FontWeight fw){
    if(m.pageComponents[globalpagenum] .liswid[position] is TextForm ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as TextForm ;
      x .fw=FontWeight.bold;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is bullted ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as bullted ;
      x .fw=FontWeight.bold;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is checkbox ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as checkbox ;
      x .fw=FontWeight.bold;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is NumberdList ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as NumberdList ;
      x .fw=FontWeight.bold;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is toggleList ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as toggleList ;
      x .fw=FontWeight.bold;
    }
    // #add conditions for table and calender , image , audio , voice , video#

    emit(modifyTextBold());
  }
  void modifyTxetToItalic(FontStyle fs){
    if(m.pageComponents[globalpagenum] .liswid[position] is TextForm ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as TextForm ;
      x .fs=FontStyle.italic;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is bullted ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as bullted ;
      x .fs=FontStyle.italic;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is checkbox ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as checkbox ;
      x .fs=FontStyle.italic;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is NumberdList ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as NumberdList ;
      x .fs=FontStyle.italic;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is toggleList ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as toggleList ;
      x .fs=FontStyle.italic;
    }
    // #add conditions for table and calender , image , audio , voice , video#

    emit(modifyTextItalic());
  }
  void modifyTxetToUnderLine(TextDecoration td){
    if(m.pageComponents[globalpagenum] .liswid[position] is TextForm ){
      var x =m.pageComponents[globalpagenum] . liswid[position] as TextForm ;
      x .td=TextDecoration.underline;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is bullted ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as bullted ;
      x .td=TextDecoration.underline;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is checkbox ){
      var x =m.pageComponents[globalpagenum] . liswid[position] as checkbox ;
      x .td=TextDecoration.underline;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is NumberdList ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as NumberdList ;
      x .td=TextDecoration.underline;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is toggleList ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as toggleList ;
      x .td=TextDecoration.underline;
    }
    // #add conditions for table and calender , image , audio , voice , video#

    emit(modifyTextUnderLine());
  }
  void changeColor(Color c,int i){
    if (i==0) {
      if (m.pageComponents[globalpagenum] .liswid[position] is TextForm) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as TextForm;
        x.c = Colors.white;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is bullted) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as bullted;
        x.c = Colors.white;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is checkbox) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as checkbox;
        x.c = Colors.white;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is NumberdList) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as NumberdList;
        x.c = Colors.white;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is toggleList) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as toggleList;
        x.c = Colors.white;
      }
    }
    if (i==1) {
      if (m.pageComponents[globalpagenum] .liswid[position] is TextForm) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as TextForm;
        x.c = Colors.black87;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is bullted) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as bullted;
        x.c = Colors.black87;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is checkbox) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as checkbox;
        x.c = Colors.black87;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is NumberdList) {
        var x =m.pageComponents[globalpagenum] . liswid[position] as NumberdList;
        x.c = Colors.black87;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is toggleList) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as toggleList;
        x.c = Colors.black87;
      }
    }
    if (i==2) {
      if (m.pageComponents[globalpagenum] .liswid[position] is TextForm) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as TextForm;
        x.c = Colors.blue;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is bullted) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as bullted;
        x.c = Colors.blue;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is checkbox) {
        var x =m.pageComponents[globalpagenum] . liswid[position] as checkbox;
        x.c = Colors.blue;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is NumberdList) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as NumberdList;
        x.c = Colors.blue;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is toggleList) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as toggleList;
        x.c = Colors.blue;
      }
    }
    if (i==3) {
      if (m.pageComponents[globalpagenum] .liswid[position] is TextForm) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as TextForm;
        x.c = Colors.yellow;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is bullted) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as bullted;
        x.c = Colors.yellow;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is checkbox) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as checkbox;
        x.c = Colors.yellow;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is NumberdList) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as NumberdList;
        x.c = Colors.yellow;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is toggleList) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as toggleList;
        x.c = Colors.yellow;
      }
    }
    if (i==4) {
      if (m.pageComponents[globalpagenum] .liswid[position] is TextForm) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as TextForm;
        x.c = Colors.green;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is bullted) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as bullted;
        x.c = Colors.green;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is checkbox) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as checkbox;
        x.c = Colors.green;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is NumberdList) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as NumberdList;
        x.c = Colors.green;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is toggleList) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as toggleList;
        x.c = Colors.green;
      }
    }
    if (i==5) {
      if (m.pageComponents[globalpagenum] .liswid[position] is TextForm) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as TextForm;
        x.c = Colors.red;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is bullted) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as bullted;
        x.c = Colors.red;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is checkbox) {
        var x =m.pageComponents[globalpagenum] . liswid[position] as checkbox;
        x.c = Colors.red;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is NumberdList) {
        var x = m.pageComponents[globalpagenum] .liswid[position] as NumberdList;
        x.c = Colors.red;
      }
      if (m.pageComponents[globalpagenum] .liswid[position] is toggleList) {
        var x =m.pageComponents[globalpagenum] . liswid[position] as toggleList;
        x.c = Colors.red;
      }
    }
    // #add conditions for table and calender , image , audio , voice , video#

    emit(changeTextColor());
  }
  void changesizeUp(double fsize){
    if(m.pageComponents[globalpagenum] .liswid[position] is TextForm ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as TextForm ;
      x .fsize++;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is bullted ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as bullted ;
      x .fsize++;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is checkbox ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as checkbox ;
      x .fsize++;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is NumberdList ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as NumberdList ;
      x .fsize++;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is toggleList ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as toggleList ;
      x .fsize++;
    }
    // #add conditions for table and calender , image , audio , voice , video#

    emit(changeTextSizeUp());
  }
  void changesizeDown(double fsize){
    if(m.pageComponents[globalpagenum] .liswid[position] is TextForm ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as TextForm ;
      x .fsize--;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is bullted ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as bullted ;
      x .fsize--;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is checkbox ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as checkbox ;
      x .fsize--;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is NumberdList ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as NumberdList ;
      x .fsize--;
    }
    if(m.pageComponents[globalpagenum] .liswid[position] is toggleList ){
      var x = m.pageComponents[globalpagenum] .liswid[position] as toggleList ;
      x .fsize--;
    }
    // #add conditions for table and calender , image , audio , voice , video#

    emit(changeTextSizeDown());
  }
  void reversed(page p){
    p . liswid=p .liswid.reversed.toList();
    emit(Backgroundreversedstate());
  }
  void favoritWS(){
    (favoritePage==Icons.star)?favoritePage=Icons.star_border_outlined:
    favoritePage=Icons.star;
    emit(Backgroundfavoritworkspace());
  }
  void pdfWS(){
    (printingWSasPDF==Icons.picture_as_pdf_outlined)?
    printingWSasPDF=Icons.picture_as_pdf:
    printingWSasPDF=Icons.picture_as_pdf_outlined;
    emit(Backgroundpdfworkspace());
  }
  void mode(){
    if(lightMood ==Icons.wb_incandescent_outlined ){
      lightMood =Icons.wb_incandescent ;
      backGroundColor=Colors.white;
    }
    else{
      lightMood=Icons.wb_incandescent_outlined ;
      backGroundColor=Colors.black87;
    }
    emit(Backgroundmode());
  }
  void addtoggleListatend(page p) {
    p. liswid.add(toggleList());
    if(p .liswid.last is toggleList ){
      var x=p.liswid.last as toggleList;
      x.pos=p.liswid.length-1;
    }
    emit(BackgroundaddtoggleListatEnd());
  }
  void addTextFormatendintoggle(){
    if(m.pageComponents[globalpagenum] .liswid[position] is toggleList){
      var x =m.pageComponents[globalpagenum] .liswid.last as toggleList;
      x.togglelst.add(TextForm());
    }
    emit(addtintoggle());
  }
  void addbulletedendintoggle(){
    if(m.pageComponents[globalpagenum] .liswid[position] is toggleList){
      var x =m.pageComponents[globalpagenum] .liswid.last as toggleList;
      x.togglelst.add(bullted());
    }
    emit(addbintoggle());
  }
  void addcheckboxendintoggle(){
    if(m.pageComponents[globalpagenum] .liswid[position] is toggleList){
      var x =m.pageComponents[globalpagenum] .liswid.last as toggleList;
      x.togglelst.add(checkbox());
    }
    emit(addcintoggle());
  }
  void addnumberdlistendintoggle(){
    if(m.pageComponents[globalpagenum] .liswid[position] is toggleList){
      var x =m.pageComponents[globalpagenum] .liswid.last as toggleList;
      x.togglelst.add(NumberdList());
    }
    emit(addnintoggle());
  }
  void addtableendintoggle(){
    if(m.pageComponents[globalpagenum] .liswid[position] is toggleList){
      var x =m.pageComponents[globalpagenum] .liswid.last as toggleList;
      x.togglelst.add(CrossAxisScroll());
    }
    emit(addttintoggle());
  }
  void addtoggleendintoggle(){
    if(m.pageComponents[globalpagenum] .liswid[position] is toggleList){
      var x =m.pageComponents[globalpagenum] .liswid.last as toggleList;
      x.togglelst.add(toggleList());
    }
    emit(addtttintoggle());
  }
  void addcolumn(){

     var x= m.pageComponents[globalpagenum].liswid[position] as CrossAxisScroll ;
      x.indexC ++;
    emit(addcolumnintable());
  }
  void addrow(){

    var x= m.pageComponents[globalpagenum].liswid[position] as CrossAxisScroll ;
    x.indexR ++;
   emit(addrowintable());
  }
  void addtable(){
    m.pageComponents[globalpagenum] .liswid.insert(position + 1, CrossAxisScroll());
    var x = m.pageComponents[globalpagenum] .liswid[position + 1] as CrossAxisScroll;
    x.pos=position+1 ;

    for (int i = position + 2; i < m.pageComponents[globalpagenum] .liswid.length; i++) {
      if(m.pageComponents[globalpagenum] .liswid[i] is CrossAxisScroll ){
        var x = m.pageComponents[globalpagenum]  .liswid[i] as CrossAxisScroll ;
        x .pos += 1;
      }

      if(m.pageComponents[globalpagenum] .liswid[i] is TextForm ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as TextForm ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is bullted ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as bullted ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is checkbox ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as checkbox ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is NumberdList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as NumberdList ;
        x .pos += 1;
      }
      if(m.pageComponents[globalpagenum] .liswid[i] is toggleList ){
        var x = m.pageComponents[globalpagenum] .liswid[i] as toggleList ;
        x .pos += 1;
      }
      // #add conditions for calender , image , audio , voice , video#
    }

    emit(addtablei());
  }
  void addtableend(page p) {
    p. liswid.add(CrossAxisScroll());
    if(p.liswid.last is CrossAxisScroll ){
      var x=p .liswid.last as CrossAxisScroll;
      x.pos=p .liswid.length-1;
    }
    emit(BackgroundaddtoggleListatEnd());
  }
  Future<void> cap_pages(workspace w)
  async {
    await myPages.getAllPages();
    page y = page(x: 0,);
    if(myPages.Pages.length>0)
    {
      w.pageComponents=[];
      w.pageName.removeAt(0);
    }
    for(int i=0;i<myPages.Pages.length;i++)
    {
      y.pageNum=await myPages.Pages.elementAt(i).Position;
      y.NAMe=await myPages.Pages.elementAt(i).name;
      w.pageComponents.insert(i,page(name:myPages.Pages.elementAt(i).name,x:i,i:myPages.Pages.elementAt(i).Pid));
    }
    await txtBut(w);
    await cap_components(w);
    emit(a7aaaaa());
    w.cc+=1;
  }
  Future<void> txtBut(workspace w)
  async {
    for(int i=0;i<w.pageComponents.length;i++) {
      w.pageName.add(TextButton
        (onPressed: () {
        globalpagenum = w.pageComponents[i].pageNum;
        emit(aaa7aaaaa());
      },
          child:
          Text(w.pageComponents
              .elementAt(i)
              .NAMe)));
    }
    emit(a7aaaaa());
     w.ccc=1;
  }
  Future <void> cap_components(workspace w)
  async {

    for(int i =0;i<w.pageComponents.length;i++)
    {

      for(int j=0;j<await myPages.Pages.elementAt(i).components.length;j++)
        {
          if(myPages.Pages.elementAt(i).components.elementAt(j).type=="CheckBox")
          {
            w.pageComponents.elementAt(i).liswid.insert( j,
                checkbox(
              x:myPages.Pages.elementAt(i).components.elementAt(j).data.first.txt,
              Pid:myPages.Pages.elementAt(i).components.elementAt(j).Pid ,
              ca:myPages.Pages.elementAt(i).components.elementAt(j).id ,
              txtid:myPages.Pages.elementAt(i).components.elementAt(j).data.first.id ,)
            );
            emit(aaanaaaaa());
          }
          else if(myPages.Pages.elementAt(i).components.elementAt(j).type=="TextForm")
          {

            w.pageComponents.elementAt(i).liswid.insert(j,TextForm
              (x:myPages.Pages.elementAt(i).components.elementAt(j)
                .data.first.txt,Pid:myPages.Pages.elementAt(i)
                .components.elementAt(j).Pid ,
                ca:myPages.Pages.elementAt(i).components.elementAt(j).id ,
                txtid:myPages.Pages.elementAt(i).components.elementAt(j).data.first.id ,));
              emit(aaanaaaaa());
            }
          else if(myPages.Pages.elementAt(i).components.elementAt(j).type=="Bullted")
          {
            w.pageComponents.elementAt(i).liswid.insert(j,bullted
              (x:myPages.Pages.elementAt(i).components.elementAt(j)
                .data.first.txt,Pid:myPages.Pages.elementAt(i)
                .components.elementAt(j).Pid ,
              ca:myPages.Pages.elementAt(i).components.elementAt(j).id ,
              txtid:myPages.Pages.elementAt(i).components.elementAt(j).data.first.id ,));
            emit(aaanaaaaa());
          }
        }
    }
    emit(aa7aaaaa());

  }
  Future<void> addPage(String t,workspace w)
  async {
    ADD A=ADD();
    storePage p;
    page y = page(x: w.pageComponents.length,);
     p=await A.AddPage(t,y.pageNum);
    y.id=p.Pid;
    w.pageComponents.add(y);
    w.pageName.add(
        TextButton(
          onPressed: () {
            globalpagenum=y.pageNum;
            print(globalpagenum);
            myPages.Pages.add(p);
            emit(addpag());

          },
              child: Text(t),));
        globalpagenum=y.pageNum;
    emit(addpag());
  }
  void addfirstpage(workspace w)
  {
       w.pageName.add(
           TextButton(
               onPressed: () {
                 globalpagenum = 0;
                 print(globalpagenum);
                 emit(saba7());
               },
               child: Text('firstPage'))
       );
     w.counter++;

   }
  void intialStateComp(Widget c,String s)
  {    var x=c as checkbox;
     c.mainText.text=s;
   }
  Future<void> deletePage(String t,workspace w) async {

    int x =w.pageComponents.length;
    int y =w.pageName.length-1;
    for(int i =0;i<x;i++){
      if(w.pageComponents[i].NAMe == t ){
        print(w.pageComponents[i].NAMe);
        print("looooooooooooooooooooool");
        print(w.pageComponents.elementAt(i).id);
        final docRef =await FirebaseFirestore.instance
            .collection("users")
            .doc(userModel.Uid)
            .collection("Pages").doc(w.pageComponents.elementAt(i).id).delete();
        if (i == x-1) {
          w.pageName.removeAt(i);
          globalpagenum=i-1;
          w.pageComponents.removeAt(i);
        }
        else {
          globalpagenum=i-1;
          w.pageName.removeAt(i);
          w.pageComponents.removeAt(i);

        }
        for(int j =i;j<w.pageComponents.length;j++){
          w.pageComponents[j].pageNum--;
        }
        break;
      }
      //for i
    }
    emit(del());
  }
}