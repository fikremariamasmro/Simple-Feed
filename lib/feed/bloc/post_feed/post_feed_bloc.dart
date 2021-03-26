import 'package:bloc/bloc.dart';
import '../../../app.dart';

class PostFeedCubit extends Cubit<PostFeedState> {
  FeedRepository feedRepository = FeedRepository();
  PostFeedCubit() : super(InitialPostFeedState());

  addPostFeed(feed) async {
    emit(PostFeedLoadingState());
    try {
      final res = await feedRepository.postFeed(feed);
      if (res.statusCode == 200) {
        emit(PostFeedSavedState(message: res.statusMessage));
      } else {
        emit(PostFeedErrorState(errorMessage: res.statusMessage));
      }
    } catch (e) {
      emit(PostFeedErrorState(errorMessage: e.toString()));
    }
  }
}
