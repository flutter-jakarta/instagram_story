import 'package:flutter/material.dart';
import 'package:instagram_story/model/user_story.dart';
import 'package:instagram_story/ui/widgets/story_actions.dart';
import 'package:instagram_story/ui/widgets/story_info.dart';

class StoryPage extends StatefulWidget {
  final UserStory userStory;

  const StoryPage({
    Key key,
    @required this.userStory,
  }) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int activeStory = 0;

  void _nextStory() {
    if (activeStory >= widget.userStory.stories.length - 1) {
      return null;
    }

    setState(() {
      activeStory++;
    });
  }

  void _prevStory() {
    if (activeStory <= 0) {
      return null;
    }

    setState(() {
      activeStory--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          _buildStoryMedia(),
          _buildStoryHud(),
          _buildStoryActions(),
          _buildGestureDetector(),
        ],
      ),
    );
  }

  Widget _buildStoryActions() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StoryActions(),
      ),
    );
  }

  Widget _buildStoryHud() {
    return Container(
      padding: EdgeInsets.all(10),
      child: StoryInfo(
        avatarUrl: widget.userStory.user.avatarUrl,
        userName: widget.userStory.user.userName,
        storyCreatedAt: widget.userStory.stories[activeStory].createdAt,
      ),
    );
  }

  Widget _buildGestureDetector() {
    return Row(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: _prevStory,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: _nextStory,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStoryMedia() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage(widget.userStory.stories[activeStory].mediaUrl),
            fit: BoxFit.cover),
      ),
    );
  }
}
