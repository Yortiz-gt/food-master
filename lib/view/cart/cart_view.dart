import 'package:Ubu_Shop/config/theme/theme.dart';
import 'package:Ubu_Shop/controller/cart/cart_controller.dart';
import 'package:Ubu_Shop/controller/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return GetBuilder<CartController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: DefaultColor.secondary,
          title: const Text('Carrito de Compras'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ListView.builder(
            itemCount: controller.cartItems.length,
            itemBuilder: (context, index) {
              return Card(
                color: DefaultColor.primaryOpacity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.fromLTRB(20, 1, 20, 20),
                elevation: 10,
                child: ListTile(
                  leading: Image.asset(controller.cartItems[index].image,
                      width: 80, height: 80),
                  title: Text(controller.cartItems[index].name),
                  subtitle: Text(
                      'Q${controller.cartItems[index].price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (controller.cartItems[index].quantity > 1) {
                            controller.cartItems[index].quantity--;
                            controller.update();
                          }
                        },
                      ),
                      Text(controller.cartItems[index].quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          controller.cartItems[index].quantity++;
                          controller.update();
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 204, 95, 95),
                        ),
                        onPressed: () {
                          controller.removeItem(index);
                          controller.update();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            decoration: const BoxDecoration(
              color: DefaultColor.secondary,
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total a Pagar: Q ${controller.getTotal().toStringAsFixed(2)}',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (controller.cartItems.isNotEmpty) {
                      controller.cartItems = [];
                      controller.update();
                      Get.toNamed('/payment');
                    }
                  },
                  child: Text(
                    'Continuar con el Pago',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 13,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
