import 'package:flutter/material.dart';
import 'package:instagram_story/model/user_story.dart';
import 'package:instagram_story/ui/pages/story_page.dart';

class StoryListPage extends StatelessWidget {
  final List<UserStory> userStories;
  PageController _pageController = PageController();

  StoryListPage({Key key, this.userStories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return StoryPage(
              onNextPage: _nextPage,
              userStory: userStories[index],
            );
          },
          itemCount: userStories.length,
        ),
      ),
    );
  }

  void _nextPage() {
    if (_pageController.page == userStories.length - 1) {
      return;
    }

    _pageController.nextPage(
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }
}
