import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class FeedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FeedFetchedEvent extends FeedEvent {}

class FeedFechMoreEvent extends FeedEvent {}

class FeedLikeEvent extends FeedEvent {
  final String id;
  FeedLikeEvent({@required this.id});
}

class FeedUnLikeEvent extends FeedEvent {
  final String id;
  FeedUnLikeEvent({@required this.id});
}
