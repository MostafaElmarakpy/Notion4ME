import 'package:bmi_calculator/modules/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class firebaseEditor
{
  String Pid="";
  String Cid="";
  String Txtid="";
  firebaseEditor(this.Pid,this.Cid,this.Txtid);
  Future<void> editPositionsOfComp({int from=0,int to =0,int value=0})
  async {
    final  docRef = await FirebaseFirestore.instance
        .collection("users").doc(userModel.Uid).collection("Pages")
        .doc(Pid).collection("Components").orderBy("position").get()
        .then((res){
          for(int i=0;i<res.docs.length;i++)
            {
              if(res.docs.elementAt(i)["position"]>from-1)
                {
                  if(res.docs.elementAt(i)["position"]<to+1)
                    {
                         FirebaseFirestore.instance
                          .collection("users").doc(userModel.Uid).collection("Pages")
                          .doc(Pid).collection("Components").doc(res.docs.elementAt(i).id)
                          .update({"position":res.docs.elementAt(i)["position"]+value}).then((value) => null)
                             .onError((error, stackTrace)  {print(error.toString());});
                    }
                }
            }
        });
  }

}