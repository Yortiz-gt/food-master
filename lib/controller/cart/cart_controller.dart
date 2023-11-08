import 'package:Ubu_Shop/model/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<Product> cartItems = [
    Product('Producto 1', 'assets/onboarding/producto1.png', 10.99, 1),
    Product('Producto 2', 'assets/onboarding/producto1.png', 15.99, 2),
    Product('Producto 3', 'assets/onboarding/producto1.png', 7.99, 1),
  ];

  void removeItem(int index) {
    cartItems.removeAt(index);
    update();
  }

  double getTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  void updateView() {
    update();
  }
}
