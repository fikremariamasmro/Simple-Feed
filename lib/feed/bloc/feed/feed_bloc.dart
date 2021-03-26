import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_feed/data/data.dart';
import 'bloc.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(const FeedState());
  FeedRepository feedRepository = FeedRepository();

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    if (event is FeedFetchedEvent) {
      yield await _mapFeedFetchedToState(state);
    } else if (event is FeedFechMoreEvent) {
      yield await _mapFeedFetcheMoreToState(state);
    } else if (event is FeedLikeEvent) {
      yield await _mapFeedLikeEvenToState(event);
      //yield await _mapFeedFetchedToState(state);
    } else if (event is FeedUnLikeEvent) {
      yield await _mapFeedUnLikeEvenToState(event);
      //yield await _mapFeedFetchedToState(state);
    }
  }

  Future<FeedState> _mapFeedFetchedToState(FeedState state) async {
    if (state.hasReachedMax) return state;
    try {
      final feed = await feedRepository.fechFeeds(state.page);
      return state.copyWith(
          status: FeedListStatus.success,
          feeds: feed.docs,
          hasReachedMax: false,
          page: int.parse(feed.page),
          pages: feed.pages,
          limit: feed.limit,
          total: feed.total);
    } on Exception {
      return state.copyWith(status: FeedListStatus.failure);
    }
  }

  Future<FeedState> _mapFeedFetcheMoreToState(FeedState state) async {
    if (state.hasReachedMax) return state;
    try {
      final feed = await feedRepository.fechFeeds(state.page);
      return state.page == state.pages
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: FeedListStatus.success,
              feeds: List.of(state.feedlist)..addAll(feed.docs),
              hasReachedMax: false,
              page: int.parse(feed.page) + 1,
              pages: feed.pages,
              limit: feed.limit,
              total: feed.total);
    } on Exception {
      return state.copyWith(status: FeedListStatus.failure);
    }
  }

  Future _mapFeedLikeEvenToState(FeedLikeEvent event) async {
    try {
      return await feedRepository.likeFeed(event.id);
    } catch (e) {
      print("Error Like Feed: $e");
    }
  }

  Future _mapFeedUnLikeEvenToState(FeedUnLikeEvent event) async {
    try {
      return await feedRepository.unLikeFeed(event.id);
    } catch (e) {
      print("Error Un Like Feed: $e");
    }
  }
}
