import 'package:Ubu_Shop/config/theme/theme.dart';
import 'package:Ubu_Shop/controller/dashboard/dashboard_controller.dart';
import 'package:Ubu_Shop/view/cart/cart_view.dart';
import 'package:Ubu_Shop/view/profile/profile_view.dart';
import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return GetBuilder<DashboardController>(builder: (_) {
      return Scaffold(
        body: SafeArea(child: pages.elementAt(controller.selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset("assets/onboarding/home.png"),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/onboarding/bookmark.png"),
              label: 'Carrito',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/onboarding/user.png"),
              label: 'Usuario',
            ),
          ],
          currentIndex: controller.selectedIndex,
          onTap: controller.onItemTapped,
        ),
      );
    });
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Header(),
                const SpacerCustom(),
                const Search(),
                Visibility(
                  visible: controller.showSearchMode,
                  child: Column(
                    children: [
                      Carousel(controller: controller),
                      const SpacerCustom(),
                      const TitleSection(
                        title: "Categorias",
                      ),
                      const Categories(),
                      const TitleSection(
                        title: "Productos",
                      ),
                    ],
                  ),
                ),
                const ListProducts()
              ],
            ),
          ),
        );
      },
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.count(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: (1 / 1.3),
            children: List.generate(
              controller.products.length,
              (index) {
                return Container(
                  margin: const EdgeInsets.only(right: 15, bottom: 15),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      height: 150,
                      width: MediaQuery.sizeOf(context).width,
                      child: Center(
                          child: Image.asset(
                        controller.searchImage(controller.products[index].name),
                        height: 150,
                      )),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          color: DefaultColor.primaryOpacity),
                      height: 75,
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (controller.products[index].name ?? '')
                                    .toUpperCase(),
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: DefaultColor.secondary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                "\$${controller.products[index].price ?? ''}",
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: DefaultColor.secondary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => {},
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: DefaultColor.secondary),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class SpacerCustom extends StatelessWidget {
  const SpacerCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 28,
    );
  }
}

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: TextField(
            controller: controller.searchController,
            cursorColor: DefaultColor.secondary,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: DefaultColor.secondary),
                borderRadius: BorderRadius.circular(15.0),
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 50),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              prefixIcon: const Icon(
                Icons.search,
                color: DefaultColor.secondary,
              ),
              hintText: 'Buscar Producto...',
              suffixIcon: Pulse(
                infinite: true,
                manualTrigger: true,
                controller: (aniController) =>
                    controller.animationController = aniController,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: controller.speechEnabled
                        ? DefaultColor.primaryOpacity
                        : Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        1000,
                      ),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () => {
                      controller.startStopListening(),
                    },
                    icon: const Icon(
                      Icons.mic,
                      color: DefaultColor.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return GetBuilder<DashboardController>(builder: (_) {
      return SizedBox(
        height: 150.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ItemCat(
                controller: controller,
                image: "assets/onboarding/frutas_cat.png",
                descripcion: 'Frutas',
              ),
              ItemCat(
                controller: controller,
                image: "assets/onboarding/carnes_cat.png",
                descripcion: 'Carnes',
              ),
              ItemCat(
                controller: controller,
                image: "assets/onboarding/verdura_cat.png",
                descripcion: 'Vegetales',
              ),
              ItemCat(
                controller: controller,
                image: "assets/onboarding/lacteos_cat.png",
                descripcion: 'Lacteos',
              ),
              ItemCat(
                controller: controller,
                image: "assets/onboarding/mariscos_cat.png",
                descripcion: 'Mariscos',
              ),
            ],
          ),
        ),
      );
    });
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            color: DefaultColor.secondary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class ItemCat extends StatelessWidget {
  const ItemCat({
    super.key,
    required this.image,
    required this.descripcion,
    required this.controller,
  });

  final String image;
  final String descripcion;
  final DashboardController controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.filterByCategory(descripcion);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: DefaultColor.primaryOpacity,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  1000,
                ),
              ),
            ),
            child: Center(
              child: Image.asset(image),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            descripcion,
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: DefaultColor.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(color: DefaultColor.secondary),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/onboarding/logo.png",
              width: 75,
            ),
            Text(
              "Ubu Shop",
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
    required this.controller,
  });

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: controller.carouselController,
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 2,
        autoPlay: true,
      ),
      items: controller.items.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: DefaultColor.secondary,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        i,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

List<Widget> pages = <Widget>[
  const Home(),
  const CartView(),
  const ProfileView(),
];
