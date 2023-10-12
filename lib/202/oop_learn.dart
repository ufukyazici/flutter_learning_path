import 'dart:io';

import 'package:flutter_application_1/202/custom_exception.dart';

abstract class IFileDownload {
  void downloadItem(FileItem? fileItem);
  bool download(params) {
    return true;
  }
}

class FileDownload {
  void downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

class DownloadVideo implements IFileDownload {
  @override
  void downloadItem(FileItem? fileItem) {}

  @override
  bool download(params) {
    throw UnimplementedError();
  }
}

class DownloadImage extends IFileDownload with PathBuilder {
  @override
  void downloadItem(FileItem? fileItem) {}
}

mixin PathBuilder on IFileDownload {
  void pathBuild(params) {}
}

//implements tüm özellikleri alır ve classın kendine özgü şekilde dolrurulması gerekir
//extends tüm özellikleri fonksiyonlarla birlikte alır ve üzerine eklemeler yapılabilir
