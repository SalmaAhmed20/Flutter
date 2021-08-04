import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeGridItem extends StatelessWidget {
  Category category;
  HomeGridItem(this.category);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(category.imagePath,
                height: 140,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.purple.withOpacity(0.8),
              ),
              child: Text(
                category.title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.end,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Category {
  String title;
  String imagePath;
  Category(this.title, this.imagePath);
}
