import 'package:flutter/material.dart';
import '../FireBase/getPage.dart';
import 'bulleted.dart';
import 'checkbox.dart';


getPages myPages=getPages();
int position = 0;
int globalpagenum=0;
TextEditingController tecbulleted =TextEditingController();

Color ColorOfText= Colors.white;
Color ColorOfBulletedIcon= Colors.white54;
String s=tecbulleted.text;

List<bool> impval(){
  List<bool>valuefirst=[];
  for(int i =0;i<valuefirst.length;i++)valuefirst.add(false);
  return valuefirst ;
}
IconData favoritePage = Icons.star_border_outlined;

IconData printingWSasPDF = Icons.picture_as_pdf_outlined;

IconData lightMood = Icons.wb_incandescent_outlined;

Color backGroundColor = Colors.black87;

