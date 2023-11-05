import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/303/mobx_image_picker/model/image_upload_response.dart';

class ImageUploadService {
  final Dio dio;
//https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com
  ImageUploadService({required this.dio});
  Future<ImageUploadResponse?> uploadImageToServer(Uint8List byteArray, String name,
      {void Function(int, int)? onSendProgress}) async {
    var formData = FormData.fromMap({"": MultipartFile.fromBytes(byteArray)});
    final response = await dio.post("/full%2F$name.png", data: formData, onSendProgress: onSendProgress);
    if (response.statusCode == HttpStatus.ok) {
      return ImageUploadResponse.fromJson(response.data);
    }
    return null;
  }
}
