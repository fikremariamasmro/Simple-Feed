import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_feed/app.dart';

class FeedFormScreen extends StatelessWidget {
  final _captionController = TextEditingController();
  FeedBloc _feedBloc;
  PostFeedCubit _postFeedCubit = PostFeedCubit();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _feedBloc = BlocProvider.of<FeedBloc>(context);
    return BlocProvider<PostFeedCubit>(
        create: (context) => _postFeedCubit,
        child: Form(
          key: _formKey,
          child: BlocProvider(
              create: (context) => ImagePickerCubit(),
              child: Scaffold(
                  appBar: AppBar(
                    elevation: 0.0,
                    leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: () => Navigator.of(context).pop()),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: _buildPostButton(context),
                      )
                    ],
                  ),
                  body: BlocListener<PostFeedCubit, PostFeedState>(
                    listener: (_, state) {
                      if (state is PostFeedErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                          ),
                        );
                      }
                      if (state is PostFeedSavedState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              Constants.postSuccessMessge,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                    value: _feedBloc, child: FeedsScreen())));
                      }
                    },
                    child: BlocBuilder<PostFeedCubit, PostFeedState>(
                      builder: (_, state) {
                        if (state is InitialPostFeedState) {
                          _buildForm(context);
                        } else if (state is PostFeedLoadingState) {
                          return LoadingIndicator();
                        }
                        return _buildForm(context);
                      },
                    ),
                  ))),
        ));
  }

  _buildPostButton(BuildContext context) {
    return BlocBuilder<ImagePickerCubit, File>(builder: (conext, state) {
      return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                return Colors.pink;
              },
            ),
          ),
          onPressed: () => _postFeed(state, context),
          child: Text(Constants.postButton));
    });
  }

  _buildForm(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ImageSelector(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _captionController,
              validator: _buildCaptionValidator,
              maxLines: null,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: Constants.postHintText),
            ),
          )
        ],
      ),
    );
  }

  String _buildCaptionValidator(value) {
    if (value == null || value.isEmpty) {
      return Constants.postFeedCaptionValidator;
    }
    return null;
  }

  _postFeed(File image, context) {
    if (image != null) {
      if (_formKey.currentState.validate()) {
        _postFeedCubit.addPostFeed(
            FeedFormModel(caption: _captionController.text, image: image));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(Constants.postFeedImageValidator),
        ),
      );
    }
  }
}
