import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';

class ImageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return BlocBuilder<ImagePickerCubit, File>(builder: (conext, state) {
      return GestureDetector(
        child: state == null
            ? Container(
                decoration: BoxDecoration(color: Colors.grey[100]),
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Image.file(
                state,
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
        onTap: () => context.read<ImagePickerCubit>().selectImage(null),
      );
    });
  }
}
