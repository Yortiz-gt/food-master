import 'package:Ubu_Shop/controller/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  String paymentMethod = 'Tarjeta de Crédito';
  bool showCreditCardForm = false;

  void togglePaymentMethod(String method) {
    paymentMethod = method;
    showCreditCardForm = method == 'Tarjeta de Crédito';
    update();
  }

  void finishPayment() {
    Get.delete<DashboardController>();
    Get.toNamed('/dashboard', arguments: {'indexPage': 0});
  }
}
