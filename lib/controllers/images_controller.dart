import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  Rxn<String?> imagePath = Rxn<String?>(null);

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path;
      // Update Hive box as well
      await Hive.box('ImageData').put('imagePath', image.path);
    }
  }
  Future<String?> getSavedImagePath() async {
    final box = Hive.box('ImageData'); // Open box for String type
    return box.get('imagePath');
  }
}