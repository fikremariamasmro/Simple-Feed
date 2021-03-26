import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';

class FeedListScreen extends StatefulWidget {
  @override
  _FeedListScreenState createState() => _FeedListScreenState();
}

class _FeedListScreenState extends State<FeedListScreen> {
  final _scrollController = ScrollController();
  FeedBloc _feedBloc;

  @override
  void initState() {
    super.initState();
    _feedBloc = context.read<FeedBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        switch (state.status) {
          case FeedListStatus.failure:
            return const Center(child: Text('Failed to fetch feed'));
          case FeedListStatus.success:
            if (state.feedlist.isEmpty) {
              return const Center(child: Text('No feeds'));
            }
            return NotificationListener<ScrollNotification>(
                onNotification: _onScroll,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return index >= state.feedlist.length
                        ? LoadingIndicator()
                        : BlocProvider.value(
                            value: _feedBloc,
                            child: FeedCard(feedModel: state.feedlist[index]),
                          );
                  },
                  controller: _scrollController,
                  itemCount: state.hasReachedMax
                      ? state.feedlist.length
                      : state.feedlist.length + 1,
                ));
          default:
            return LoadingIndicator();
        }
      },
    );
  }

  bool _onScroll(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      _feedBloc.add(FeedFechMoreEvent());
    }

    return false;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
    _feedBloc.distinct();
  }
}
