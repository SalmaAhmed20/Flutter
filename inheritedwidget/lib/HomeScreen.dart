import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _score = 10;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50,),
          Score(
            score: _score,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CurrentScore(),
                //CurrentScore(this.score),
              ],
            ),
          ),
          SizedBox(height: 50,),
          ElevatedButton(
            child: const Text(
              'Change',
              style: TextStyle(fontSize: 30),
            ),
            onPressed: () {
              setState(() {
                _score = ++_score;
              });
            },
          ),
        ],
      ),
    );
  }
}

//inherited widget
class Score extends InheritedWidget {
  const Score({
    Key? key,
    required this.score,
    required Widget child,
  })  :super(key: key, child: child);
  final int score;
  static Score? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Score>();
  }

  @override
  bool updateShouldNotify(covariant Score oldWidget) {
    return oldWidget.score != score;
  }
}

////////////////////////////////
class CurrentScore extends StatelessWidget {
  const CurrentScore();

  @override
  Widget build(BuildContext context) {
    final Score? _score = Score.of(context);

    return Container(
      child: Text(_score!.score.toString(),style: TextStyle(fontSize: 40),),
    );
  }
}
