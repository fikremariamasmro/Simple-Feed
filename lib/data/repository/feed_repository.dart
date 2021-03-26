import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:simple_feed/data/api/api.dart';

import '../data.dart';

abstract class FeedRepo {
  Future<UserModel> verifyAccount();
  Future<UserModel> fechUserById(String userId);
  Future logout();

  Future<FeedModel> fechFeeds(int page);
  Future<FeedModel> fechFeedById(String postId);

  Future postFeed(FeedFormModel feed);
  Future likeFeed(String postId);
  Future unLikeFeed(String postId);
}

class FeedRepository implements FeedRepo {
  HttpService _httpService = HttpService();

  @override
  Future<UserModel> verifyAccount() async {
    final response = await _httpService.get(path: ApiRoutes.verifyAccount);
    if (response.statusCode == 200) {
      final data = json.decode(response.data);
      return UserModel.fromJson(data);
    }
  }

  @override
  Future<UserModel> fechUserById(String userId) async {
    final response =
        await _httpService.get(path: ApiRoutes.fechFeedById + userId);
    if (response.statusCode == 200) {
      final data = json.decode(response.data);
      return UserModel.fromJson(data);
    }
  }

  @override
  Future<Response> postFeed(FeedFormModel feed) async {
    try {
      final response =
          await _httpService.post(path: ApiRoutes.postFeed, data: feed);
      if (response.statusCode == 200) {
        return response;
      } else {
        return response;
      }
    } catch (e) {
      return e.response;
    }
  }

  @override
  Future<FeedModel> fechFeeds(int page) async {
    try {
      final response = await _httpService.get(
          path: ApiRoutes.fechFeedList + page.toString());
      if (response == null) return null;
      return feedModelFromJson(json.encode(response.data));
    } catch (e) {
      debugPrint(e);
    }
  }

  @override
  Future<FeedModel> fechFeedById(String postId) async {
    final response = await _httpService.get(path: ApiRoutes.fechFeedById);
    if (response.statusCode == 200) {
      return feedModelFromJson(response.data['docs']);
      //return FeedModel.fromJson(data);
    }
  }

  @override
  Future likeFeed(String postId) async {
    try {
      final response =
          await _httpService.put(path: ApiRoutes.likeFeed + postId);
      if (response.statusCode == 200) {
        return response.statusMessage;
      }
    } catch (e) {
      debugPrint("Like Feed Error :" + e);
    }
  }

  @override
  Future unLikeFeed(String postId) async {
    try {
      final response =
          await _httpService.put(path: ApiRoutes.unLikeFeed + postId);
      if (response.statusCode == 200) {
        return response.statusMessage;
      }
    } catch (e) {
      debugPrint("Un Like Feed Error :" + e);
    }
  }

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
