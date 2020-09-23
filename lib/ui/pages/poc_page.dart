import 'package:flutter/material.dart';
import 'dart:math';

class POCPage extends StatefulWidget {
  @override
  _POCPageState createState() => _POCPageState();
}

class _POCPageState extends State<POCPage> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    double degValueLeft = _degreeToRadian(_value * 90);
    double degValueRight = _degreeToRadian((_value - 1) * 90);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(degValueLeft),
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://loremflickr.com/600/600?random=9'),
                      ),
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(degValueRight),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://loremflickr.com/600/600?random=10'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Slider(
              min: 0,
              max: 1,
              onChanged: (double v) {
                setState(() {
                  _value = v;
                });
              },
              value: _value,
            )
          ],
        ),
      ),
    );
  }

  _degreeToRadian(double deg) {
    return deg * pi / 180;
  }
}
