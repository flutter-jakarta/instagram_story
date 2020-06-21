import 'package:flutter/material.dart';

class StoryThumbnail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.redAccent,
                Colors.yellowAccent,
              ],
              begin: FractionalOffset(1, 1),
              end: FractionalOffset(-1, -1),
            ),
            shape: BoxShape.circle,
          ),
          child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://picsum.photos/250?image=9'),
              )),
        ),
        SizedBox(height: 6),
        Text('flutter_boy')
      ],
    );
  }
}
