import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/303/mobx_image_picker/model/image_upload_response.dart';
import 'package:flutter_application_1/303/mobx_image_picker/service/image_upload_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'image_upload_view_model.g.dart';

class ImageUploadViewModel = _ImageUploadViewModelBase with _$ImageUploadViewModel;

abstract class _ImageUploadViewModelBase with Store {
  static const _baseUrl = "https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com/o/";
  @observable
  String imageUrl = "";

  @observable
  File? file;
  @observable
  String downloadText = "";

  ImageUploadService imageUploadService = ImageUploadService(dio: Dio(BaseOptions(baseUrl: _baseUrl)));

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void updateDownloadText(int sent, int total) {
    downloadText = "$sent/$total";
  }

  @action
  void uploadImageUrl(ImageUploadResponse? response) {
    if (response == null) return;
    imageUrl =
        "https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com/o/${response.name?.replaceFirst("/", "%2F") ?? ""}";
  }

  @action
  void saveToLocale(XFile? file) {
    if (file == null) return;
    this.file = File(file.path);
  }

  Future<void> saveDataToService() async {
    if (file == null) return;
    changeLoading();
    final response = await imageUploadService.uploadImageToServer(
      await file!.readAsBytes(),
      "google123",
      onSendProgress: (sent, total) {
        updateDownloadText(sent, total);
      },
    );
    changeLoading();
    uploadImageUrl(response);
  }
}
