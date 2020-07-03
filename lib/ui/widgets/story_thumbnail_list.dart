import 'package:flutter/material.dart';
import 'package:instagram_story/ui/pages/story_list_page.dart';
import 'package:instagram_story/ui/widgets/story_thumbnail.dart';
import 'package:instagram_story/model/user_story.dart';

class StoryThumbnailList extends StatelessWidget {
  final List<UserStory> userStories;

  const StoryThumbnailList({Key key, this.userStories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => StoryListPage(
                    userStories: userStories,
                  ),
                ),
              );
            },
            child: StoryThumbnail(userStory: userStories[index]));
      },
      itemCount: userStories.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 20,
        );
      },
    ));
  }
}
