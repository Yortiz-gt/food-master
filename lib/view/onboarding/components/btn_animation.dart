import 'package:Ubu_Shop/config/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class AnimationBtn extends StatelessWidget {
  const AnimationBtn({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _btnAnimationController.isActive = true;
        Get.toNamed('/login');
      },
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            RiveAnimation.asset(
              "assets/animation/button.riv",
              controllers: [_btnAnimationController],
            ),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(CupertinoIcons.arrow_right),
                  Text(
                    "Ingresar",
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(color: DefaultColor.black)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
