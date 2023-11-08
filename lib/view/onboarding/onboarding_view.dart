import 'dart:ui';
import 'package:Ubu_Shop/config/theme/theme.dart';
import 'package:Ubu_Shop/controller/onboarding/onboarding_controller.dart';
import 'package:Ubu_Shop/view/onboarding/components/btn_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return GetBuilder<OnboardingController>(builder: (_) {
      return Scaffold(
        body: Stack(
          children: [
            Positioned(
              child: Image.asset("assets/onboarding/background.jpg"),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: DefaultColor.primaryOpacity,
                  ),
                ),
              ),
            ),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        Text(
                          "Dale sabor a la vida",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                            fontSize: 60,
                            fontFamily: "Poppins",
                            height: 1.2,
                            fontWeight: FontWeight.w600,
                            color: DefaultColor.secondary,
                          )),
                        ),
                        Text(
                          "Descubre los mejores frutas y verduras del mercado.",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            color: DefaultColor.secondary,
                          )),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 7,
                  ),
                  AnimationBtn(
                    btnAnimationController: controller.btnAnimationController,
                    press: () {
                      controller.btnAnimationController.isActive = true;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      "Todos nuestros proveedores están dispuestos a consentirte.",
                      style: GoogleFonts.montserrat(
                          textStyle:
                              const TextStyle(color: DefaultColor.secondary)),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      );
    });
  }
}
