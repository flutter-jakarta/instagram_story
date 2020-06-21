import 'package:flutter/material.dart';
import 'package:instagram_story/ui/widgets/story_thumbnail.dart';

class StoryThumbnailList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: 8),
        children: <Widget>[
          StoryThumbnail(),
          SizedBox(width: 20),
          StoryThumbnail(),
          SizedBox(width: 20),
          StoryThumbnail(),
          SizedBox(width: 20),
          StoryThumbnail(),
          SizedBox(width: 20),
          StoryThumbnail(),
          SizedBox(width: 20),
          StoryThumbnail()
        ],
      ),
    );
  }
}
