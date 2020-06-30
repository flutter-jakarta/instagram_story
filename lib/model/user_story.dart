import 'package:instagram_story/model/story.dart';
import 'package:instagram_story/model/user.dart';

class UserStory {
  int id;
  bool isRead;
  User user;
  List<Story> stories;

  UserStory({this.id, this.isRead, this.user, this.stories});

  UserStory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isRead = json['isRead'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['stories'] != null) {
      stories = new List<Story>();
      json['stories'].forEach((v) {
        stories.add(new Story.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isRead'] = this.isRead;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.stories != null) {
      data['stories'] = this.stories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
