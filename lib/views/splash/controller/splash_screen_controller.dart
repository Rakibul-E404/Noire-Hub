import 'package:get/get.dart';
import '../../../auth/log_in_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Navigate to login screen after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => LogInScreen());
    });
  }
}