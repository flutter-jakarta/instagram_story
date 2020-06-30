class Story {
  int id;
  String mediaType;
  String mediaUrl;
  String createdAt;

  Story({this.id, this.mediaType, this.mediaUrl, this.createdAt});

  Story.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaType = json['mediaType'];
    mediaUrl = json['mediaUrl'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mediaType'] = this.mediaType;
    data['mediaUrl'] = this.mediaUrl;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
