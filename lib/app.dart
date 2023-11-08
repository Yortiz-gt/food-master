import 'package:Ubu_Shop/config/routes/routes_name.dart';
import 'package:Ubu_Shop/config/routes/routes_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.onboarding,
      getPages: RoutesPage().pages,
    );
  }
}
