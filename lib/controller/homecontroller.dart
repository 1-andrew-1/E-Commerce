import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furitshop/controller/firebase_asynic.dart';
import 'package:furitshop/views/screens/Favourite/myfavourite.dart';
import 'package:furitshop/views/screens/account/myaccount.dart';
import 'package:furitshop/views/screens/cart/mycaed.dart';
import 'package:furitshop/core/class/functions/productapi.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController {
  final FirebaseAsync firebaseAsync = Get.put(FirebaseAsync());
  RxBool isfetched = true.obs;
  ProductApi productapi = ProductApi();
  List<dynamic>? data;
  List<dynamic> favorite = [].obs;
  List<dynamic> cart = <Map<String, dynamic>>[].obs; // Reactive list of maps
  void addToFavorite(int id) {
    if (check(id)) {
      favorite.remove(id
          .obs); // Remove the product from the favorite list if it exists there  
    } else {
      favorite.add(id.obs); // Add the product as a favorite
    }
    List<dynamic> normalNumbers = favorite.map((rx) => rx.value).toList();
    firebaseAsync.updateUserFavorites(favorite: normalNumbers);
  }

  // ignore: non_constant_identifier_names
  void loading_screen() {
    Future.delayed(Duration(seconds: 3), () {
      isfetched.value = false;
    });
  }

  bool check(int id) {
    if (favorite.contains(id.obs)) {
      return true;
    }
    return false;
  }

  RxDouble totalPrice = 0.0.obs; // Reactive total price

  // Method to calculate total price
  void calculateTotal() {
    double total = 0.0;
    for (var item in cart) {
      int count = item['id'].value;
      var product = data![count];
      int quantity = item['quantity'].value;
      total += quantity * double.parse(product["price"].toString());
    }
    totalPrice.value = total;
  }

  getproduct() async {
    data = await productapi.getProducts();
    isfetched.value = true;
    update();
  }

  void addToCart(int id) {
    // Check if item already exists in cart
    var existingItem = cart.firstWhereOrNull((item) => item['id'] == id);

    if (existingItem != null) {
      existingItem['quantity'].value += 1; // Increment quantity
    } else {
      cart.add({'id': id.obs, 'quantity': 1.obs}); // Add new item
    }
    firebaseAsync.updateUserCart(cart: convertdata(cart: cart));
  }

  RxInt quantity = 1.obs;
  void updateQuantity(int index, int newQuantity) {
    cart[index]['quantity'] = newQuantity.obs;
    update();
  }

  // searching for products
  final TextEditingController searchingtext = TextEditingController();
  List<dynamic>? searchingData; // Filtered data
  void updateSearch(String query) {
    //String query = searchingtext.toString() ;
    if (query.isEmpty) {
      searchingData = null;
    } else {
      searchingData = data!
          .where((item) => item["title"]
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
    update(); // Notify listeners
  }

  // convert the data to a list
  convertdata({
    required List<dynamic> cart,
  }) {
    List<dynamic> normalCart = cart.map((item) {
      return item.map(
          (key, value) => MapEntry(key, value is Rx ? value.value : value));
    }).toList();
    return normalCart;
  }

  // ✅ Fetch User's Cart & Favorites and Update Reactive Lists
  String getCurrentUserUID() {
    return FirebaseAuth.instance.currentUser?.uid ?? '';
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> showOrder = []; // ✅ Maintain proper typing
  // Fetch user's cart and favorites from Firestore
  Future<void> getUserCartAndFavorites() async {
    String userUID = getCurrentUserUID();
    if (userUID.isEmpty) {
      return; // Ensure user is logged in
    }
    try {
      // Fetch user document
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(userUID).get();

      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // 🔹 Convert cart data to RxList<Map<String, dynamic>>
        if (data.containsKey('Cart') && data['Cart'] is List) {
          List<Map<String, dynamic>> normalCart =
              List<Map<String, dynamic>>.from(data['Cart']);
          // Convert all fields to Rx types and make the list reactive
          cart = normalCart
              .map((item) {
                return item.map((key, value) {
                  return MapEntry(
                      key, _wrapWithRx(value)); // Wrap all values with Rx
                });
              })
              .toList()
              .obs; // Wrap the entire list in .obs to make it reactive
        }
        // 🔹 Convert favorite data to RxList<dynamic>
        if (data.containsKey('Favourite') && data['Favourite'] is List) {
          favorite = List<dynamic>.from(data['Favourite'])
              .map((item) => _wrapWithRx(item))
              .toList()
              .obs; // Wrap all values with Rx
        }
        if (data.containsKey('orders') && data['orders'] is List) {
          showOrder = (data['orders'] as List)
              .map((item) => item as Map<String, dynamic>)
              .toList();
          //print(showOrder);
        }
      }
    } catch (e) {
      //print(e);
    }
  }

// Helper function to wrap any value with Rx
  dynamic _wrapWithRx(dynamic value) {
    if (value is num) {
      return value.obs; // Wrap numbers with RxInt or RxDouble
    } else if (value is String) {
      return value.obs; // Wrap strings with RxString
    } else if (value is bool) {
      return value.obs; // Wrap booleans with RxBool
    } else if (value is Map<String, dynamic>) {
      return value.map((key, value) =>
          MapEntry(key, _wrapWithRx(value))); // Recursively wrap nested maps
    } else if (value is List) {
      return value
          .map((item) => _wrapWithRx(item))
          .toList()
          .obs; // Recursively wrap nested lists
    } else {
      return Rx<dynamic>(value); // Default wrapper for other types
    }
  }
}

class SelectPage extends GetxController {
  int currentPageIndex = 0;
  void getSelectedPage(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Get.to(() => const Mycaed() , transition: Transition.circularReveal , duration: Duration(milliseconds: 650 ));
        break;
      case 2:
        Get.to(() => const Myfavourite() , transition: Transition.circularReveal, duration: Duration(milliseconds: 650 ));
        break;
      case 3:
        Get.to(() => const Myaccount() , transition: Transition.cupertino, duration: Duration(milliseconds: 650 ));
        break;
      default:
        const Text('Home Page');
        break;
    }
  }
}
