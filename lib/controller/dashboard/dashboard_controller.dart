import 'package:Ubu_Shop/models/productos_model.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class DashboardController extends GetxController {
  TextEditingController searchController = TextEditingController();
  int selectedIndex = 0;
  int current = 0;
  final CarouselController carouselController = CarouselController();
  List<String> items = [
    "assets/onboarding/promo_1.png",
    "assets/onboarding/promo_2.jpg",
    "assets/onboarding/promo_3.jpg"
  ];

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final SpeechToText _speechToText = SpeechToText();
  String _textResultSpeech = '';
  bool _speechEnabled = false;
  bool _showSearchMode = true;
  late AnimationController animationController;
  List<Category> products = [];
  List<Category> productsAux = [];
  List<Category> productsMain = [];

  get textResultSpeech => _textResultSpeech;
  String get textSearchController => searchController.text;

  bool get speechEnabled => _speechEnabled;
  bool get showSearchMode => _showSearchMode;

  @override
  void onInit() {
    super.onInit();
    selectedIndex = 0;
    getListProduct();
    listenerSearchText();
  }

  Future<void> initSpeech() async {
    await _speechToText.initialize();
  }

  void startStopListening() {
    _speechEnabled ? stopListening() : startListening();
    _speechEnabled = !_speechEnabled;
    update();
  }

  void startListening() async {
    await initSpeech();

    await _speechToText.listen(onResult: _onSpeechResult);
    animationController.forward();
    animationController.repeat();
  }

  void stopListening() async {
    await _speechToText.stop();
    animationController.reset();
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    _textResultSpeech = result.recognizedWords;

    searchController.text = _textResultSpeech;

    result.finalResult ? startStopListening() : null;
  }

  getListProduct() async {
    QuerySnapshot snapshot = await firestore.collection("ecommergt").get();
    products = [];

    (snapshot.docs[0].data() as dynamic).forEach((key, value) {
      value.forEach((value) {
        products.add(Category.fromJson(value, key));
        productsAux.add(Category.fromJson(value, key));
        productsMain.add(Category.fromJson(value, key));
      });
    });

    update();
  }

  filterByCategory(String category) {
    products = [];
    productsAux.forEach((e) => {
          if (e.categoryName?.toLowerCase() == category.toLowerCase())
            {products.add(e)}
        });
    update();
  }

  List<Category> searchProduct() {
    List<Category> productsSearch = [];
    productsSearch = productsMain
        .where((element) =>
            element.name!
                .toLowerCase()
                .contains(searchController.text.trim().toLowerCase()) ||
            element.categoryName!
                .toLowerCase()
                .contains(searchController.text.trim().toLowerCase()))
        .toList();
    return productsSearch;
  }

  listenerSearchText() {
    searchController.addListener(() {
      _showSearchMode = searchController.text.isEmpty;
      if (!_showSearchMode) {
        products = searchProduct();
      } else {
        products = productsMain;
      }
      update();
    });
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }

  String searchImage(String? name) {
    final images = {
      'Puyazo': 'assets/onboarding/puyazo.png',
      'Culotte': 'assets/onboarding/culote.png',
      'Manzana': 'assets/onboarding/manzana.png',
      'Pera': 'assets/onboarding/pera.png',
      'Banana': 'assets/onboarding/banana.png',
      'pepino': 'assets/onboarding/pepino.png',
      'queso': 'assets/onboarding/queso.png',
      'leche': 'assets/onboarding/leche.png',
      'pescado': 'assets/onboarding/pescado.png',
      'camaron': 'assets/onboarding/camaron.png',
    };
    return images[name] ?? "assets/onboarding/producto1.png";
  }
}
