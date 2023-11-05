import 'package:image_picker/image_picker.dart';

class ImageUploadManager {
  final ImagePicker picker = ImagePicker();
  Future<XFile?> fetchFromLibrary() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}
