class storeTxt
{
  String id="";
  String txt="";
  String fontWeight="";
  int fontColor=-1;
  double fontSize=-1;
  int row=-1;
  int colm=-1;
  storeTxt({required this.txt,required this.fontColor,required this.fontSize,required this.fontWeight,required this.colm,required this.row,required this.id});
  Map<String, dynamic> toMap() {
    return {
      'txt': txt,
      'fontWeight': fontWeight,
      'fontColor':fontColor,
      'fontSize':fontSize,
      'row':row,
      'colm':colm
    };
  }
}