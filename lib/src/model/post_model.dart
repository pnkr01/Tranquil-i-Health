import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? id;
  String? email;
  String? postId;
  String? ownerId;
  String? username;
  String? location;
  String? description;
  String? mediaUrl;
  String? ownerurl;
  DateTime? timestamp;

  PostModel({
    this.id,
    this.email,
    this.postId,
    this.ownerId,
    this.username,
    this.location,
    this.description,
    this.mediaUrl,
    this.ownerurl,
    this.timestamp,
  });
  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['postId'];
    ownerId = json['ownerId'];
    location = json['location'];
    username = json['username'];
    description = json['description'];
    mediaUrl = json['mediaUrl'];
    ownerurl = json['ownerurl'];
    timestamp = (json['timestamp'] as Timestamp).toDate();
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['postId'] = postId;
    data['ownerId'] = ownerId;
    data['location'] = location;
    data['description'] = description;
    data['mediaUrl'] = mediaUrl;
    data['timestamp'] = timestamp;
    data['username'] = username;
    data['ownerurl'] = ownerurl;
    return data;
  }
}
