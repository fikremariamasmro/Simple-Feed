import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PostFeedState extends Equatable {}

class InitialPostFeedState extends PostFeedState {
  @override
  List<Object> get props => [];
}

class PostFeedLoadingState extends PostFeedState {
  @override
  List<Object> get props => [];
}

class PostFeedSavedState extends PostFeedState {
  final String message;
  PostFeedSavedState({this.message});

  @override
  List<Object> get props => [message];
}

class PostFeedErrorState extends PostFeedState {
  final String errorMessage;
  PostFeedErrorState({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
