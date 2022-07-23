import 'package:bmi_calculator/FireBase/storeTxt.dart';
import 'package:bmi_calculator/layout/listbuilder.dart';
import 'package:bmi_calculator/modules/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class storeComponent {
  String Pid="";
  String id = "";
  String type = "";
  int position = -1;
  List <storeTxt> data =[];

  storeComponent(String type, int position,String id,String Pid) {
    this.type = type;
    this.position = position;
    this.Pid=Pid;
    this.id=id;
  }

  Future<void> addData(storeTxt t) async {
    data.add(t);
    final  docRef = await FirebaseFirestore.instance.collection("users").doc(userModel.Uid).collection("Pages")
        .doc(Pid).collection("Components").doc(this.id)
        .collection("text").add(t.toMap()).then(
            (value)
      {
          t.id=value.id;
      });
  }
  Future<void> getAllTxt()
    async {
      final docRef =await FirebaseFirestore.instance
          .collection("users").doc(userModel.Uid).collection("Pages")
          .doc(Pid).collection("Components").doc(id).collection("text");
      await docRef.get().then((res)
      {

        //storeTxt t=storeTxt(fontWeight: "dsds",fontSize: 24,fontColor: 2,txt: "ddd",colm: -1,row: -1);
        print(res.docs.length);
        for(int i=0;i<res.docs.length;i++)
        {
          /*t.id=res.docs.elementAt(i).id;
          t.fontColor=res.docs.elementAt(i)["fontColor"];
          t.fontWeight=res.docs.elementAt(i)["fontWeight"];
          t.fontSize=res.docs.elementAt(i)["fontSize"];
          t.txt=res.docs.elementAt(i)["txt"];*/
          data.add( storeTxt(txt: res.docs.elementAt(i)["txt"],
              fontColor: res.docs.elementAt(i)["fontColor"],
              fontSize: res.docs.elementAt(i)["fontSize"],
              fontWeight: res.docs.elementAt(i)["fontWeight"],
              row: res.docs.elementAt(i)["row"],
              colm:res.docs.elementAt(i)["colm"],
              id: res.docs.elementAt(i).id,
          ));
        }
      }
      );
    
  }
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'position': position,
    };
  }
}