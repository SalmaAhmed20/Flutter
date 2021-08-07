
import 'package:flutter/material.dart';
import 'package:tictactoe/GrideView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<String>> _matrix = new List<List<String>>(3);
  String lastChar = 'O';
  Gride grid;
  _MyHomePageState() {
    initMatrix();
    this.grid = Gride(this._matrix);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GView(0, 0),
                GView(0, 1),
                GView(0, 2),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GView(1, 0),
                GView(1, 1),
                GView(1, 2),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GView(2, 0),
                GView(2, 1),
                GView(2, 2),
              ],
            )
          ],
        ),
      ),
    );
  }

  void initMatrix() {
    for (int i = 0; i < _matrix.length; i++) {
      _matrix[i] = List(3);
      for (int j = 0; j < _matrix[i].length; j++) _matrix[i][j] = '';
    }
    lastChar='O';
  }

  GView(int i, int j) {
    return GestureDetector(
        onTap: () {
          Play(i, j);
          if ( Winner(i, j)) {
            _ShowAlert(_matrix[i][j]);
          } else {
            if(isEmpty())
              _ShowAlert(null);
          }
        },
        child: grid.view(i, j));
  }

  //logic
  Play(int i, int j) {
    setState(() {
      if (_matrix[i][j] == '') if (lastChar == 'O') {
        _matrix[i][j] = 'X';
        lastChar = 'X';
      } else {
        _matrix[i][j] = 'O';
        lastChar = 'O';
      }
    });
  }

  //who the winner
  Winner(int i, int j) {
    var col = 0, row = 0, rdiog = 0, ldiog = 0;
    var n = _matrix.length - 1;
    var player = _matrix[i][j];

    for (int k = 0; k < _matrix.length; k++) {
      if (_matrix[i][k] == player) col++;
      if (_matrix[k][j] == player) row++;
      if (_matrix[k][k] == player) ldiog++;
      if (_matrix[k][n - k] == player) rdiog++;
    }
    if (row == n + 1 || col == n + 1 || ldiog == n + 1 || rdiog == n + 1) {
     return true;
    }
    return false;
  }

  bool isEmpty() {
    var emp = true;
    _matrix.forEach((element) {
      element.forEach((j) {
        if (j == '') emp = false;
      });
    });
    return emp;
  }

  _ShowAlert(String winner) {
    String txt;
    if (winner == null)
      txt = 'It\'s draw';
    else
      txt = 'Player $winner is WON!';
    print (txt);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Center(child: Text('Game Over')),
              content:  Text(txt),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        initMatrix();
                      });
                    },
                    child: Text('Reset'))
              ]);
        });
  }
}
