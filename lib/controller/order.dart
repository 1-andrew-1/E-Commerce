import 'package:furitshop/controller/firebase_asynic.dart';
import 'package:furitshop/controller/homecontroller.dart';
import 'package:get/get.dart';

class Ordercontroller extends GetxController {
  String citiesName = "الإسكندرية";
  final List<String> cities = [
    "القاهرة", // Cairo
    "الجيزة", // Giza
    "الإسكندرية", // Alexandria
    "أسوان", // Aswan
    "أسيوط", // Assiut
    "البحيرة", // Beheira
    "بني سويف", // Beni Suef
    "الدقهلية", // Dakahlia
    "دمياط", // Damietta
    "الفيوم", // Fayoum
    "الغربية", // Gharbia
    "الإسماعيلية", // Ismailia
    "كفر الشيخ", // Kafr El Sheikh
    "الأقصر", // Luxor
    "مطروح", // Matrouh
    "المنيا", // Minya
    "المنوفية", // Menoufia
    "الوادي الجديد", // New Valley
    "شمال سيناء", // North Sinai
    "بورسعيد", // Port Said
    "القليوبية", // Qalyubia
    "قنا", // Qena
    "البحر الأحمر", // Red Sea
    "الشرقية", // Sharqia
    "سوهاج", // Sohag
    "جنوب سيناء", // South Sinai
    "السويس", // Suez
  ];
  final Homecontroller homecontroller = Get.put(Homecontroller());
  final FirebaseAsync controller = Get.put(FirebaseAsync()) ;
  List<dynamic> orderList = <Map<String, dynamic>>[].obs;
  // Function to move homecontroller.cart items to order list and clear the homecontroller.cart
  // Function to merge homecontroller.cart items into one order and add cities
  void placeOrder() {
    // Creating a single order with all homecontroller.cart items and cities
    Map<String, dynamic> newOrder = {
      'items': List.from(homecontroller.convertdata(cart: homecontroller.cart)), // Copy all homecontroller.cart items
      'cities': citiesName, // Store unique cities
      'timestamp': DateTime.now().toString(), // Optional timestamp
    };
    controller.showOrder.add(newOrder); // Add single order to orderList
    print(controller.showOrder);
    controller.sendOrderToFirestore(newOrder: controller.showOrder );
    homecontroller.cart.clear(); // Empty the homecontroller.cart
    // print ("=======================================$orderList");
  }
}
