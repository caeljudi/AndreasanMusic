import 'package:andreasan/controllers/audio_controller.dart';
import 'package:andreasan/controllers/upload_controller.dart';
import 'package:andreasan/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(UploadController());
    Get.lazyPut(() => AudioController());
  }
}
 