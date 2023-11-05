import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/mobx_image_picker/viewModel/image_upload_view_model.dart';
import 'package:flutter_application_1/product/utility/image_upload.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({super.key});

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  final String _imageUploadLottiePath = "https://lottie.host/a604ad84-b764-45f8-a013-e1b84a7190c1/EAMRTYzRYL.json";
  final _imageUploadViewModel = ImageUploadViewModel();
  final _imageUploadManager = ImageUploadManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _imageUploadViewModel.saveDataToService();
        },
      ),
      appBar: AppBar(
        title: const Text("Image Upload"),
        centerTitle: true,
        actions: [
          Observer(builder: (_) {
            return _imageUploadViewModel.isLoading ? const CircularProgressIndicator() : const SizedBox();
          }),
          Observer(builder: (_) {
            return Text(_imageUploadViewModel.downloadText);
          }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Card(
                elevation: 10,
                child: Row(
                  children: [
                    Observer(builder: (context) {
                      return _imageUploadViewModel.file != null
                          ? Expanded(child: Image.file(_imageUploadViewModel.file!))
                          : const SizedBox();
                    }),
                    Expanded(
                      child: FittedBox(
                        child: IconButton(
                          onPressed: () async {
                            _imageUploadViewModel.saveToLocale(await _imageUploadManager.fetchFromLibrary());
                          },
                          icon: Lottie.network(_imageUploadLottiePath),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          const Divider(),
          Expanded(
              flex: 4,
              child: Observer(builder: (_) {
                return _imageUploadViewModel.imageUrl.isNotEmpty
                    ? Image.network(_imageUploadViewModel.imageUrl)
                    : const SizedBox();
              })),
        ],
      ),
    );
  }
}
