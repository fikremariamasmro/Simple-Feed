import 'package:flutter/material.dart';
import 'package:simple_feed/data/data.dart';

class FavoriteButton extends StatelessWidget {
  final Feed feed;
  FavoriteButton({@required this.feed});
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.favorite,
          color: feed.isLiked ? Colors.blue : Colors.grey,
        ),
        label: Text(feed.likes.toString()));
  }
}
