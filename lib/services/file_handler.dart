import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class FileHandler {
  File _image;
  String filePath;
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> saveImageOnLocal() async {
    if (_image != null) {
      final path = await localPath;
      String filePath = '/' + Uuid().v4() + '.jpg';
      File file = await _image.copy(path + filePath);
      return file.path;
    } else
      return null;
  }

  Future<String> imgFromCamera() async {
    File image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    _image = image;
    return saveImageOnLocal();
  }

  Future<String> imgFromGallery() async {
    File image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    _image = image;
    return saveImageOnLocal();
  }
}
