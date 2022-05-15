import 'dart:io';
import 'package:data/provider/file_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FirebaseFileProvider extends FileProvider {
  static const String _SOCIAL_EVENTS = 'social_events';

  @override
  Future<void> saveFile({required File file}) async {
    await FirebaseStorage.instance
        .ref()
        .child(_SOCIAL_EVENTS)
        .child(_getFileNameByPath(file.path))
        .putFile(file);
  }

  @override
  Future<String> getFileUrl({required File file}) async {
    return FirebaseStorage.instance
        .ref()
        .child(_SOCIAL_EVENTS)
        .child(_getFileNameByPath(file.path))
        .getDownloadURL();
  }

  String _getFileNameByPath(String path) {
    return basename(path);
  }
}
