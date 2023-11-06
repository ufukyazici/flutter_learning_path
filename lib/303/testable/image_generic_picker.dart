import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/utility/image_upload_manager.dart';

class ImagePickerGenericView extends StatefulWidget {
  const ImagePickerGenericView({super.key});

  @override
  State<ImagePickerGenericView> createState() => _ImagePickerGenericViewState();
}

class _ImagePickerGenericViewState extends State<ImagePickerGenericView> {
  late final ImageUploadCustomManager _imageUploadGalleryManager;
  late final ImageUploadCustomManager _imageUploadCameraManager;
  @override
  @override
  void initState() {
    super.initState();
    _imageUploadGalleryManager = ImageUploadCustomManager(GalleryImageUpload());
    _imageUploadCameraManager = ImageUploadCustomManager(CameraImageUpload());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              _imageUploadGalleryManager.cropWithFetch();
            },
            child: const Text("Upload from gallery")),
        ElevatedButton(
            onPressed: () {
              _imageUploadCameraManager.cropWithFetch();
            },
            child: const Text("Upload from camera")),
      ]),
    );
  }
}
