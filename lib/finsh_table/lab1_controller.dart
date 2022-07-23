import 'package:get/get.dart';



class Lab1Controller extends GetxController {
  late LabState labState;

  String get header => labState.header;
  String get xAxis => labState.xAxis;
  String get yAxis => labState.yAxis;

  int get yLength => labState.yLength;
  int get xLength => labState.xLength;

  Map<int, String> get xAxisNames => labState.xAxisNames;
  Map<int, String> get yAxisNames => labState.yAxisNames;

  List<List<String>> get matrix => labState.matrix;


  @override
  void onInit() {
    super.onInit();

    labState = LabState(
      header: ' ',
      xAxis: 'Column ',
      yAxis: 'Row',
      yLength: 1,
      xLength: 1,
      //status: AnswerStatus.none,
      matrix: List.generate(
        100,
            (i) => List.generate(100, (j) => ""),
      ),
      //answerList: [],
    );
  }


  void onYChanged(dynamic expert) {
    labState.yLength = expert as int;
    if (labState.yAxisNames.length < labState.yLength) {}
    update();
  }

  void onAlternativeChanged(dynamic alternative) {
    labState.xLength = alternative as int;
    update();
  }

  void updateText(int row, int column, String value) {
    labState.matrix[row][column] = value;//.isEmpty ? 0 : int.parse(value);
  }



}



class LabState {
  final String header;
  final String xAxis;
  final String yAxis;

  int yLength;
  int xLength;


  final Map<int, String> xAxisNames;
  final Map<int, String> yAxisNames;

  final List<List<String>> matrix;

  LabState({
    required this.header,
    required this.xAxis,
    required this.yAxis,
    required this.xLength,
    required this.yLength,
    required this.matrix,

  })  : xAxisNames =
  Map.of(List.generate(10, (index) => '$xAxis $index').asMap()),
        yAxisNames =
        Map.of(List.generate(10, (index) => '$yAxis ${index + 1}').asMap());
}

