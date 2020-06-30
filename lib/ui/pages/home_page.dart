import 'package:flutter/material.dart';
import 'package:instagram_story/services/user_story_services.dart';
import 'package:instagram_story/ui/widgets/story_thumbnail_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        body: FutureBuilder(
          future: getUserStories(context),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return StoryThumbnailList(userStories: snapshot.data);
            } else if (snapshot.hasError) {
              return Text('Error');
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
