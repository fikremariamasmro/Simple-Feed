var feedJson = <String, dynamic>{
  "likes": 0,
  "_id": "5f1820b56dcc433388cb37be",
  "caption":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque consequat ex, et congue dui vestibulum quis. Aliquam semper egestas placerat. Nunc rutrum diam in ligula fermentum, sed porttitor sem venenatis. Fusce eu nulla risus. Ut nibh lacus, placerat elementum congue eu, fermentum id dui. ",
  "image": "2c64b4e0-cc0d-11ea-a24f-6bd49825b191_placeholder-landscape.png",
  "user": {
    "posts": 2,
    "followers": 0,
    "followings": 0,
    "_id": "5f16bb69f3f6e610239b12f8",
    "account": "5f16bb69f3f6e610239b12f7",
    "username": "overheadintended",
    "name": "wolfdelightful",
    "profilePic": "profile.jpeg",
    "bio": "Hello there",
    "created_at": "2020-07-21T09:54:49.000Z",
    "updated_at": "2020-07-22T11:19:17.000Z",
    "__v": 1,
  },
  "created_at": "2020-07-22T11:19:17.000Z",
  "updated_at": "2020-07-22T11:19:17.000Z",
  "isLiked": false,
  "__v": 1,
};

var expectedFeedJson = <String, dynamic>{
  "likes": 0,
  "_id": "5f1820b56dcc433388cb37be",
  "caption":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque consequat ex, et congue dui vestibulum quis. Aliquam semper egestas placerat. Nunc rutrum diam in ligula fermentum, sed porttitor sem venenatis. Fusce eu nulla risus. Ut nibh lacus, placerat elementum congue eu, fermentum id dui. ",
  "image": "2c64b4e0-cc0d-11ea-a24f-6bd49825b191_placeholder-landscape.png",
  "user": "5f16bb69f3f6e610239b12f8",
  "created_at": "2020-07-22T11:19:17.000Z",
  "updated_at": "2020-07-22T11:19:17.000Z",
  "isLiked": false,
  "__v": 1,
};

var paginatedFeedJson = <String, dynamic>{
  "docs": [
    {
      "likes": 0,
      "_id": "5f1820b56dcc433388cb37be",
      "caption":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque consequat ex, et congue dui vestibulum quis. Aliquam semper egestas placerat. Nunc rutrum diam in ligula fermentum, sed porttitor sem venenatis. Fusce eu nulla risus. Ut nibh lacus, placerat elementum congue eu, fermentum id dui. ",
      "image": "2c64b4e0-cc0d-11ea-a24f-6bd49825b191_placeholder-landscape.png",
      "user": {
        "posts": 2,
        "followers": 0,
        "followings": 0,
        "_id": "5f16bb69f3f6e610239b12f8",
        "account": "5f16bb69f3f6e610239b12f7",
        "username": "overheadintended",
        "name": "wolfdelightful",
        "profilePic": "profile.jpeg",
        "bio": "Hello there",
        "created_at": "2020-07-21T09:54:49.695Z",
        "updated_at": "2020-07-22T11:19:17.864Z",
        "__v": 0
      },
      "created_at": "2020-07-22T11:19:17.899Z",
      "updated_at": "2020-07-22T11:19:17.899Z",
      "__v": 0,
      "isLiked": false
    },
    {
      "likes": 0,
      "_id": "5f16bf0dbc462e1ba61914d4",
      "caption":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque consequat ex, et congue dui vestibulum quis. Aliquam semper egestas placerat. Nunc rutrum diam in ligula fermentum, sed porttitor sem venenatis. Fusce eu nulla risus. Ut nibh lacus, placerat elementum congue eu, fermentum id dui. ",
      "image": "5fa4a9b0-cb3a-11ea-b904-fb66eae566af_placeholder-landscape.png",
      "user": {
        "posts": 2,
        "followers": 0,
        "followings": 0,
        "_id": "5f16bb69f3f6e610239b12f8",
        "account": "5f16bb69f3f6e610239b12f7",
        "username": "overheadintended",
        "name": "wolfdelightful",
        "profilePic": "profile.jpeg",
        "bio": "Hello there",
        "created_at": "2020-07-21T09:54:49.695Z",
        "updated_at": "2020-07-22T11:19:17.864Z",
        "__v": 0
      },
      "created_at": "2020-07-21T10:10:21.121Z",
      "updated_at": "2020-07-21T10:17:00.790Z",
      "__v": 0,
      "isLiked": false
    }
  ],
  "total": 2,
  "limit": 4,
  "page": "1",
  "pages": 1
};

var feedFormJson = <String, dynamic>{
  "caption":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque consequat ex, et congue dui vestibulum quis. Aliquam semper egestas placerat. Nunc rutrum diam in ligula fermentum, sed porttitor sem venenatis. Fusce eu nulla risus. Ut nibh lacus, placerat elementum congue eu, fermentum id dui. ",
  "image": "2c64b4e0-cc0d-11ea-a24f-6bd49825b191_placeholder-landscape.png",
};
