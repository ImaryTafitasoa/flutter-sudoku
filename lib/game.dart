import 'package:flutter/material.dart';
import 'package:sudoku_starter/GrilleInterne.dart';
import 'package:sudoku_api/sudoku_api.dart';

class Game extends StatefulWidget {
  const Game({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late Puzzle _puzzle;
  int? selectedx;
  int? selectedy;

@override
  void initState() {
    PuzzleOptions puzzleOptions=PuzzleOptions(patternName: "winter");
    _puzzle=Puzzle(puzzleOptions);
    _puzzle.generate().then((_)=>setState(() {
      
    }));
    super.initState();
  }

  void _onCellTapped(int x,int y){
    setState(() {
      selectedx=x;
      selectedy=y;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;
    var width = MediaQuery.of(context).size.width;
    var maxSize = height > width ? width : height;
    var boxSize = (maxSize / 3).ceil().toDouble();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: boxSize*3,
              width: boxSize*3,
              child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(9, (x) {
                    return Container(
                      width: boxSize,
                      height: boxSize,
                      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                      child: GridView.count(
                          crossAxisCount: 3,
                        children: List.generate(9,(y){
                          int? cellvalue=_puzzle.board()?.matrix()?[x][y].getValue();
                          return  GrilleInterne(x: x, y: y,value: cellvalue, isSelected: selectedx==x && selectedy==y,onTap: ()=> _onCellTapped(x,y));
                        }),
                      ),
                    );
                  })
              ),
            ),
          ],
        ),
      ),
    );
  }
}
