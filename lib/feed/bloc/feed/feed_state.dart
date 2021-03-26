import 'package:equatable/equatable.dart';
import 'package:simple_feed/data/data.dart';

enum FeedListStatus { initial, success, failure }

class FeedState extends Equatable {
  const FeedState(
      {this.status = FeedListStatus.initial,
      this.feedlist = const <Feed>[],
      this.hasReachedMax = false,
      this.limit,
      this.total,
      this.page = 1,
      this.pages});

  final FeedListStatus status;
  final List<Feed> feedlist;
  final bool hasReachedMax;
  final int total;
  final int limit;
  final int page;
  final int pages;

  FeedState copyWith({
    FeedListStatus status,
    List<Feed> feeds,
    bool hasReachedMax,
    int page,
    int pages,
    int limit,
    int total,
  }) {
    return FeedState(
        status: status ?? this.status,
        feedlist: feeds ?? this.feedlist,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        page: page ?? this.page,
        pages: pages ?? this.pages,
        total: total ?? this.total,
        limit: limit ?? this.limit);
  }

  @override
  String toString() {
    return '''FeedState { status: $status, hasReachedMax: $hasReachedMax, feeds: ${feedlist.length} } page: $page } pages: $pages }''';
  }

  @override
  List<Object> get props => [status, feedlist, hasReachedMax];
}
