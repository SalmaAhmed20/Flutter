import 'package:flutter/material.dart';

import 'HomeGridItem.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Column(children: [
            SizedBox(height: 20.0),
            Container(alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors:[Colors.purple,Colors.purpleAccent],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter,
                ),
              ),
              child: Row( crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [
                Expanded(
                  child: Text('الأخبار',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),textAlign: TextAlign.center,),
                ),
                Expanded(
                  child: Text('المجلات',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),textAlign: TextAlign.center,),
                )
              ]),
            ),
            Row(children: [
              HomeGridItem(
                  Category("مجلة السياسة", 'assets/images/السياسة.jpg')),
              HomeGridItem(Category(
                  "مجلة التكنولوجيا", 'assets/images/التكنولوجيا.jpg')),
            ]),
            Row(children: [
              HomeGridItem(
                  Category("مجلة الرياضة", 'assets/images/الرياضة.jpg')),
              HomeGridItem(
                  Category("مجلة السياحة", 'assets/images/السياحة.jpg')),
            ]),
            Row(children: [
              HomeGridItem(Category("مجله الصحة", 'assets/images/الصحة.png')),
              HomeGridItem(Category("مجله حواء", 'assets/images/حواء.jpg')),
            ]),
            Row(children: [
              HomeGridItem(
                  Category("مجله الاقتصاد", 'assets/images/الاقتصاد.jpg')),
              HomeGridItem(
                  Category("مجله السيارات", 'assets/images/السيارات.jpg')),
            ]),
            Row(children: [
              HomeGridItem(Category("مجله الطهى", 'assets/images/الطهى.jpg')),
              HomeGridItem(
                  Category("مجله المعرفة", 'assets/images/المعرفة.jpg')),
            ])
          ]),
        ]));
  }
}
