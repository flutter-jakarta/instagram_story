import 'package:flutter/material.dart';
import 'package:instagram_story/ui/widgets/story_thumbnail_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          title: Text('Instagram'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            )
          ],
        ),
        body: StoryThumbnailList());
  }
}
