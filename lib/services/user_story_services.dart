import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instagram_story/model/user_story.dart';

Future<List<UserStory>> getUserStories(BuildContext context) async {
  String data =
      await DefaultAssetBundle.of(context).loadString("assets/data.json");
  Map<String, dynamic> jsonMap = json.decode(data);

  List<Map<String, dynamic>> storiesMap =
      List<Map<String, dynamic>>.from(jsonMap['userStories']);
  return storiesMap.map((userStory) => UserStory.fromJson(userStory)).toList();
}
