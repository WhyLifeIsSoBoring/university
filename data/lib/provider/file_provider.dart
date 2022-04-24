import 'dart:io';

abstract class FileProvider {
  Future<void> saveFile({required File file});

  Future<String> getFileUrl({required File file});
}
