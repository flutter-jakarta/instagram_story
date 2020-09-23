import 'package:flutter/material.dart';
import 'package:instagram_story/model/user_story.dart';
import 'package:instagram_story/ui/pages/story_page.dart';
import 'dart:math';

class StoryListPage extends StatefulWidget {
  final List<UserStory> userStories;

  StoryListPage({Key key, this.userStories}) : super(key: key);

  @override
  _StoryListPageState createState() => _StoryListPageState();
}

class _StoryListPageState extends State<StoryListPage> {
  PageController _pageController = PageController();

  double currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            print('page ${currentPage}');

            if (currentPage.floor() == index) {
              double value = currentPage - index;

              double degValue = _degreeToRadian(value * 90);

              // print('left page $value');
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(degValue),
                alignment: Alignment.centerRight,
                child: StoryPage(
                  onNextPage: _nextPage,
                  userStory: widget.userStories[index],
                ),
              );
            } else if (currentPage.floor() + 1 == index) {
              double value = currentPage - index;

              // print('right page $value');

              double degValue = _degreeToRadian(value * 90);
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateY(degValue),
                alignment: Alignment.centerLeft,
                child: StoryPage(
                  onNextPage: _nextPage,
                  userStory: widget.userStories[index],
                ),
              );
            }

            return StoryPage(
              onNextPage: _nextPage,
              userStory: widget.userStories[index],
            );
          },
          itemCount: widget.userStories.length,
        ),
      ),
    );
  }

  void _nextPage() {
    if (_pageController.page == widget.userStories.length - 1) {
      return;
    }

    // _pageController.nextPage(
    //     duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  _degreeToRadian(double deg) {
    return deg * pi / 180;
  }
}
