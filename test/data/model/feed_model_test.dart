import 'package:flutter_test/flutter_test.dart';
import 'package:simple_feed/app.dart';

import '../data/feed_data.dart';

main() {
  test("FeedModel parsing from json has no errors", () {
    expect(() => FeedModel.fromJson(paginatedFeedJson), returnsNormally);
  });

  test("FeedModel data is parsed from json and to json correctly", () {
    var feed = FeedModel.fromJson(paginatedFeedJson);
    expect(feed.toJson(), paginatedFeedJson);
  });

  test("FeedModel parsing from json has no errors (Null Check)", () {
    expect(() => FeedModel.fromJson({}), returnsNormally);
  });

  test("Feed parsing from json has no errors", () {
    expect(() => Feed.fromJson(paginatedFeedJson), returnsNormally);
  });
  test("Feed data is parsed from json and to json correctly", () {
    var feed = Feed.fromJson(feedJson);
    expect(feed.toJson(), feedJson);
  });

  test("Feed parsing from json has no errors (Null Check)", () {
    expect(() => Feed.fromJson({}), returnsNormally);
  });
}
