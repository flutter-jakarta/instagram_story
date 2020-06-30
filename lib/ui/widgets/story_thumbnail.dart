import 'package:flutter/material.dart';
import 'package:instagram_story/model/user_story.dart';

class StoryThumbnail extends StatelessWidget {
  final UserStory userStory;

  const StoryThumbnail({Key key, this.userStory}) : super(key: key);

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
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
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
                backgroundImage: NetworkImage(userStory.user.avatarUrl),
              )),
        ),
        SizedBox(height: 6),
        Text(userStory.user.userName)
      ],
    );
  }
}
