class ApiRoutes {
  //Base Url
  static const String baseUrl = 'https://simple-feed-prod.herokuapp.com/v1';

  // Account
  static const String verifyAccount = "/accounts/verify";
  static const String logout = "/accounts/logout";

  // Feed
  static const String fechFeedList = "/posts/?page=";
  static const String fechFeedById = "posts/";
  static const String postFeed = "/posts";
  static const String likeFeed = "/posts/like/";
  static const String unLikeFeed = "/posts/unlike/";

  // User
  static const String fechUserById = "/users/";
  static const String fechUserMinInfo = "/users/mine";
}
