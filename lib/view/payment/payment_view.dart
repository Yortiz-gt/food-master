import 'package:Ubu_Shop/config/theme/theme.dart';
import 'package:Ubu_Shop/controller/payment/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  final controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: DefaultColor.secondary,
          title: const Text('Pagar Pedido'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Selecciona el Método de Pago:',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: DefaultColor.secondary),
                      onPressed: () =>
                          controller.togglePaymentMethod('Tarjeta de Crédito'),
                      child: const Text('Tarjeta de Crédito'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: DefaultColor.secondary),
                      onPressed: () =>
                          controller.togglePaymentMethod('Efectivo'),
                      child: Text(
                        'Efectivo',
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (controller.showCreditCardForm)
                  Card(
                    color: DefaultColor.primaryOpacity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.fromLTRB(20, 1, 20, 20),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Ingresa los Detalles de la Tarjeta de Crédito:',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 16,
                              ),
                              color: DefaultColor.secondary,
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Número de Tarjeta'),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Fecha de Vencimiento'),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Código de Seguridad'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: DefaultColor.secondary),
                  onPressed: () {
                    controller.finishPayment();
                  },
                  child: Text(
                    'Finalizar la Compra y Regresar',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: DefaultColor.secondary),
                  onPressed: controller.finishPayment,
                  child: Text(
                    'Cancelar',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 16,
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
