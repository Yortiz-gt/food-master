import 'package:Ubu_Shop/config/theme/theme.dart';
import 'package:Ubu_Shop/controller/Login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return GetBuilder<LoginController>(builder: (_) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.4,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/onboarding/login-header.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 10,
                        right: 0,
                        child: Material(
                          color: Colors.transparent,
                          child: SizedBox(
                            width: 240,
                            child: Text(
                              "Bienvenidos a Ubu Shop",
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: DefaultColor.secondary,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 32),
                height: MediaQuery.sizeOf(context).height * 0.6,
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.emailController,
                          textCapitalization: TextCapitalization.sentences,
                          cursorColor: DefaultColor.primary,
                          validator: controller.requiredInput,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: DefaultColor.primary),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            prefixIcon: Image.asset(
                              'assets/onboarding/email.png',
                              width: 13.9,
                            ),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(width: 50),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            hintText: 'Usuario',
                            hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: DefaultColor.primaryOpacity),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.passwordController,
                          obscureText: true,
                          cursorColor: DefaultColor.primary,
                          validator: controller.requiredInput,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: DefaultColor.primary),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            prefixIcon: Image.asset(
                              'assets/onboarding/lock.png',
                              width: 13.9,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 50),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            hintText: 'contraseña',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: DefaultColor.primaryOpacity,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            fixedSize:
                                Size(MediaQuery.sizeOf(context).width, 76),
                            backgroundColor: DefaultColor.secondary,
                            elevation: 0,
                          ),
                          onPressed: () {
                            controller.signIn();
                          },
                          child: Text(
                            "Ingresar",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 38.0,
                            bottom: 38.0,
                            left: 20,
                            right: 20,
                          ),
                          child: Row(children: <Widget>[
                            const Expanded(child: Divider()),
                            Text(
                              " O ingresa con ",
                              style: GoogleFonts.montserrat(),
                            ),
                            const Expanded(child: Divider()),
                          ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 15),
                              height: 65,
                              width: 65,
                              decoration: const BoxDecoration(
                                color: DefaultColor.secondary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                    "assets/onboarding/Group.svg"),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
