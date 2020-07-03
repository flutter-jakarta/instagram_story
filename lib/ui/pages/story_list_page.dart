import 'package:flutter/material.dart';
import 'package:instagram_story/model/user_story.dart';
import 'package:instagram_story/ui/pages/story_page.dart';

class StoryListPage extends StatelessWidget {
  final List<UserStory> userStories;

  const StoryListPage({Key key, this.userStories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemBuilder: (BuildContext context, int index) {
            return StoryPage(
              userStory: userStories[index],
            );
          },
          itemCount: userStories.length,
        ),
      ),
    );
  }
}
