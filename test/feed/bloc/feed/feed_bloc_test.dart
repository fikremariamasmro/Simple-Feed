import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_feed/app.dart';
import 'package:simple_feed/data/model/user.dart';
import 'package:simple_feed/data/model/feed.dart';
import 'package:simple_feed/data/repository/feed_repository.dart';

import '../../../data/data/feed_data.dart';

class MockFeedRepository extends Mock implements FeedRepository {}

class MockFeedBloc extends MockBloc implements FeedBloc {}

void main() {
  MockFeedRepository mockFeedRepository;
  MockFeedBloc mockFeedBloc;
  setUp(() {
    mockFeedRepository = MockFeedRepository();
    mockFeedBloc = MockFeedBloc();
  });

  group('FeedBloc Group', () {
    blocTest(
      'FeedBloc.FeedFetchedEvent',
      build: () {
        when(mockFeedRepository.fechFeeds(1)).thenAnswer(
            (_) async => feedModelFromJson(paginatedFeedJson.toString()));
        return mockFeedBloc;
      },
      act: (bloc) => bloc.add(FeedFetchedEvent()),
      expect: [paginatedFeedJson],
    );
  });
}
