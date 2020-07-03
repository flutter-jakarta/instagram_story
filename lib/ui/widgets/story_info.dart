import 'package:flutter/material.dart';

class StoryInfo extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final String storyCreatedAt;

  const StoryInfo({
    Key key,
    @required this.avatarUrl,
    @required this.userName,
    @required this.storyCreatedAt,
  }) : super(key: key);

  String _getPrettyCreatedAt() {
    var createdAt = DateTime.parse(storyCreatedAt);
    var now = DateTime.now();
    int diffHours = now.difference(createdAt).inHours;
    return "${diffHours}h";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          userName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          _getPrettyCreatedAt(),
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
