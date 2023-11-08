import 'package:get/get.dart';
import 'package:rive/rive.dart';

class OnboardingController extends GetxController {
  late RiveAnimationController btnAnimationController;

  @override
  void onInit() {
    super.onInit();
    btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
  }
}
