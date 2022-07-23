class userModel
{
  String fname='';
  String lname='';
  String email='';
  static String Uid='';
  String image='';
  userModel({required this.fname,required this.lname,required this.email, required this.image});
  userModel.fromJson(Map<String, dynamic> json)
  {
    fname= json['fname'];
    lname= json['lanem'];
    email= json['email'];
    Uid= json['uid'];
    image=json['image'];
  }
  void setid(String s)
  {
    Uid=s;
  }
  String getid()
  {
    return Uid;
  }
  Map<String,dynamic> toMap()
  {
    return{
      'fname': fname,
      'lname': lname,
      'email': email,
      'uid': Uid,
    };
  }
}