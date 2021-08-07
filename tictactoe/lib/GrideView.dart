import 'package:flutter/material.dart';

class Gride {
  List<List<String>> matrix = new List<List<String>>(3);

  Gride(this.matrix);

  view(int i, int j) {
    return Container(
      width: 92.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.blueAccent),
      ),
      child: Text(
        matrix[i][j],
        style: TextStyle(
            fontSize: 90,
            color:
                matrix[i][j] == 'X' ? Colors.blueAccent : Colors.purpleAccent),
        textAlign: TextAlign.center,
      ),
    );
  }
}
