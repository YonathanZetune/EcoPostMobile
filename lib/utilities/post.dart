import 'package:EcoPost/utilities/requests.dart';
import 'package:flutter/material.dart';

class Post {
  String image;
  double lat;
  double lon;
  String name;
  String location;

  String description;
  String timestamp;
  String challenge;
  String handle;
  String profPic;
  String hashtag;
  int likes;

  Post(
      this.image,
      this.lat,
      this.lon,
      this.location,
      this.name,
      this.description,
      this.timestamp,
      this.challenge,
      this.handle,
      this.profPic,
      this.hashtag,
      this.likes);

  factory Post.fromJson(Map<String, dynamic> json) {
    List<String> latlng = json['lat_lng'].toString().split(', ');
    print("LINK : " + json["image"]);
    return new Post(
      json["image"] == ""
          ? "https://i.ibb.co/5Mk5YbX/e1a6a321239f.jpg"
          : json["image"],
      double.parse(latlng[0]),
      double.parse(latlng[1]),
      json["location"],
      json["name"] == null ? "" : json["name"],
      json["info"] == null ? "" : json["info"],
      json["timestamp"] == null ? "N/A" : json["timestamp"],
      json["challenge"],
      json["handle"] == null ? "@N/A" : json["handle"],
      json["profile_picture"],
      json["hashtag"],
      json["likes"],
    );
  }
}

class PostList {
  List<Post> posts;

  PostList(this.posts);

  factory PostList.fromJson(Map<String, dynamic> json) {
    List<Post> posts =
        new List<Post>.from(json["data"].map((i) => Post.fromJson(i)));

    return new PostList(posts);
  }
}
