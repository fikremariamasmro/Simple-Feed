import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_feed/app.dart';
import 'package:simple_feed/data/data.dart';

class FeedCard extends StatelessWidget {
  final Feed feedModel;
  FeedCard({Key key, @required this.feedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feedBloc = BlocProvider.of<FeedBloc>(context);
    return Container(
      child: Column(
        children: [
          _buildFeedImage(context),
          _buildUser(feedBloc),
          _buildFeedCaption()
        ],
      ),
    );
  }

  _buildFeedImage(BuildContext context) {
    return feedModel.image == null
        ? Placeholder(
            fallbackHeight: MediaQuery.of(context).size.height / 3.5,
          )
        : Image.network(
            Constants.imageBaseUrl + feedModel.image,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.5,
          );
  }

  _buildUser(FeedBloc feedBloc) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        feedModel.user != null ? feedModel.user.name : '',
        style: TextStyle(fontWeight: FontWeight.w900),
      ),
      subtitle: Text(
        feedModel.user != null
            ? '@' +
                feedModel.user.username +
                '.' +
                convertToAgo(feedModel.createdAt)
            : '',
        style: feedModel.isLiked ? TextStyle(color: Colors.black) : TextStyle(),
      ),
      trailing: TextButton.icon(
          onPressed: () => !feedModel.isLiked
              ? feedBloc.add(FeedLikeEvent(id: feedModel.id))
              : feedBloc.add(FeedUnLikeEvent(id: feedModel.id)),
          icon: Icon(
            feedModel.isLiked ? Icons.favorite : Icons.favorite_border_outlined,
            color: feedModel.isLiked ? Colors.pink : Colors.black,
          ),
          label: Text(
            feedModel.likes.toString(),
            style: TextStyle(
              color: feedModel.isLiked ? Colors.pink : Colors.black,
            ),
          )),
    );
  }

  _buildFeedCaption() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                feedModel.caption,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ));
  }
}
