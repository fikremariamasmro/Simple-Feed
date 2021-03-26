class UserModel {
  UserModel({
    this.posts,
    this.followers,
    this.followings,
    this.id,
    this.account,
    this.username,
    this.name,
    this.profilePic,
    this.bio,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  int posts;
  int followers;
  int followings;
  String id;
  String account;
  String username;
  String name;
  String profilePic;
  String bio;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        posts: json["posts"] != null ? json["posts"] : 0,
        followers: json["followers"] != null ? json["followers"] : 0,
        followings: json["followings"] != null ? json["followings"] : 0,
        id: json["_id"] != null ? json["_id"] : null,
        account: json["account"] != null ? json["account"] : null,
        username: json["username"] != null ? json["username"] : null,
        name: json["name"] != null ? json["name"] : null,
        profilePic: json["profilePic"] != null ? json["profilePic"] : null,
        bio: json["bio"] != null ? json["bio"] : null,
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        v: json["__v"] != null ? json["__v"] : 0,
      );

  Map<String, dynamic> toJson() => {
        "posts": posts,
        "followers": followers,
        "followings": followings,
        "_id": id,
        "account": account,
        "username": username,
        "name": name,
        "profilePic": profilePic,
        "bio": bio,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "__v": v,
      };
}
