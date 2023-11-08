import 'package:Ubu_Shop/config/routes/routes_name.dart';
import 'package:Ubu_Shop/view/dashboard/dashboard_view.dart';
import 'package:Ubu_Shop/view/login/login_view.dart';
import 'package:Ubu_Shop/view/onboarding/onboarding_view.dart';
import 'package:Ubu_Shop/view/payment/payment_view.dart';
import 'package:get/get.dart';

class RoutesPage {
  final pages = [
    GetPage(
        name: RoutesName.onboarding,
        page: () => const OnboardingView(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.login,
        page: () => const LoginView(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.dashboard,
        arguments: const {'indexPage': 0},
        page: () => const DashboardView(),
        transition: Transition.cupertino),
    GetPage(
        name: RoutesName.payment,
        page: () => const PaymentView(),
        transition: Transition.cupertino),
  ];
}
