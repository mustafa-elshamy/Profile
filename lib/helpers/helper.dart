import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

abstract class Helper {
  static Future<List> pickImages() async {
    ImagePicker imagePicker = ImagePicker();
    List<XFile> images;
    try {
      images = await imagePicker.pickMultiImage();
    } on PlatformException catch (e) {
      print(e.message);
    }
    return images;
  }

  static Future<XFile> pickVideo() async {
    ImagePicker videoPicker = ImagePicker();
    XFile videos;
    try {
      videos = await videoPicker.pickVideo(source: ImageSource.gallery);
    } on PlatformException catch (e) {
      print(e.message);
    }
    return videos;
  }
}
