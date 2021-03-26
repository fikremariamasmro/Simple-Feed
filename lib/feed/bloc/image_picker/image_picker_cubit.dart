import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCubit extends Cubit<File> {
  ImagePickerCubit() : super(null);

  void selectImage(File file) async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    emit(pickedFile);
  }
}
