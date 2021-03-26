import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';

import 'model.dart';

FeedModel feedModelFromJson(String str) => FeedModel.fromJson(json.decode(str));

List<FeedModel> feedsModelFromJson(String docs) =>
    List<FeedModel>.from(json.decode(docs).map((x) => FeedModel.fromJson(x)));

class FeedModel {
  FeedModel({
    this.docs,
    this.total,
    this.limit,
    this.page,
    this.pages,
  });

  List<Feed> docs;
  int total;
  int limit;
  String page;
  int pages;

  factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
        docs: json["docs"] != null
            ? List<Feed>.from(json["docs"].map((x) => Feed.fromJson(x)))
            : [],
        total: json["total"] != null ? json["total"] : 0,
        limit: json["limit"] != null ? json["limit"] : 0,
        page: json["page"] != null ? json["page"] : '0',
        pages: json["pages"] != null ? json["pages"] : 0,
      );

  Map<String, dynamic> toJson() => {
        "docs": docs.map((e) => e.toJson()),
        "total": total,
        "limit": limit,
        "page": page,
        "pages": pages,
      };
}

class Feed extends Equatable {
  Feed({
    this.likes,
    this.id,
    this.caption,
    this.image,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isLiked,
  });

  final int likes;
  final String id;
  final String caption;
  final String image;
  final UserModel user;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final bool isLiked;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        likes: json["likes"] != null ? json["likes"] : 0,
        id: json["_id"] != null ? json["_id"] : null,
        caption: json["caption"] != null ? json["caption"] : null,
        image: json["image"] != null ? json["image"] : null,
        user: json["user"] != null ? UserModel.fromJson(json["user"]) : null,
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        v: json["__v"] != null ? json["__v"] : 0,
        isLiked: json["isLiked"] != null ? json["isLiked"] : false,
      );

  Map<String, dynamic> toJson() => {
        "likes": likes,
        "_id": id,
        "caption": caption,
        "image": image,
        "user": user.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "__v": v,
        "isLiked": isLiked,
      };

  @override
  List<Object> get props =>
      [id, likes, caption, user, image, updatedAt, createdAt, v, isLiked];

  @override
  String toString() => 'Feed { id: $id }';
}

class FeedFormModel {
  final File image;
  final String caption;

  FeedFormModel({this.image, this.caption});

  factory FeedFormModel.fromJson(Map<String, dynamic> json) => FeedFormModel(
        caption: json["caption"] != null ? json["caption"] : null,
        image: json["image"] != null ? json["image"] : null,
      );

  Map<String, dynamic> toJson() => {
        "images": image,
        "caption": caption,
      };
}
