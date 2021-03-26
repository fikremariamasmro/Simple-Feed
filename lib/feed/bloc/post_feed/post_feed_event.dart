import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:simple_feed/data/data.dart';

abstract class PostFeedEvent extends Equatable {}

class SavePostFeedEvent extends PostFeedEvent {
  final FeedFormModel postFeed;

  SavePostFeedEvent({@required this.postFeed});

  @override
  List<Object> get props => [postFeed];
}
