class GroupModel {
  String? url;
  String? title;
  GroupModel({
    this.url,
    this.title,
  });

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      url: map['img'],
      title: map['title'],
    );
  }
}
