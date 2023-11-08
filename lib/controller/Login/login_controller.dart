import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        Get.toNamed("/dashboard", arguments: {'indexPage': 0});
      } catch (e) {
        Get.snackbar(
          'Error',
          'Error al iniciar sesión',
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
      }
    }
  }

  String? requiredInput(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return 'Campo requerido';

    return null;
  }
}
