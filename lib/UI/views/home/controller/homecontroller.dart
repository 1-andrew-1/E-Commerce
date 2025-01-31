import 'package:flutter/material.dart';
import 'package:furitshop/UI/views/Favourite/myfavourite.dart';
import 'package:furitshop/UI/views/account/myaccount.dart';
import 'package:furitshop/UI/views/cart/mycaed.dart';
import 'package:furitshop/UI/views/home/Service/productapi.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Homecontroller extends GetxController {
  RxBool isfetched = false.obs ;
  ProductApi productapi = ProductApi() ;
  List<dynamic> ? data ;
  List <dynamic> favorite = [].obs ;
  void addToFavorite(int id) {
    if (check(id)) {
      favorite.remove(id.obs); // Remove the product from the favorite list if it exists there  // TODO: implement a way to remove the product from the favorite list, such as using Firestore or a database.  // You can use the following code as a reference: favorite.removeWhere((id) => id == id.obs);  // Make sure to replace 'id' with the actual variable representing the product's ID.  // Note: This code is just a placeholder and you need to replace it with the actual implementation.  // Also, make sure to handle the case where the user tries to remove a product that is not in their favorite list.  // You can add a check to see if the product exists in the favorite list before attempting to remove it.  // For example: if (favorite.contains(id.obs)) favorite.remove(id);  // Make sure to update the UI to reflect the changes.  // You can use the Getx
    } else {
      favorite.add(id.obs); // Add the product as a favorite
    }
  }
  bool check ( int id ) {
    if( favorite.contains(id.obs)){
      return true ;
    }
    return false ;
  }

  getproduct ( ) async {
    data = await productapi.getProducts() ;
    isfetched.value = true ;
    update();
  }

  List <dynamic> cart = <Map<String, dynamic>>[].obs; // Reactive list of maps
  void addToCart(int id) {
  // Check if item already exists in cart
  var existingItem = cart.firstWhereOrNull((item) => item['id'] == id);

  if (existingItem != null) {
    existingItem['quantity'].value += 1; // Increment quantity
  } else {
    cart.add({'id': id.obs, 'quantity': 1.obs}); // Add new item
  }
}
  RxInt quantity = 1.obs;
  void updateQuantity(int index, int newQuantity) {
    cart[index]['quantity'] = newQuantity.obs;
    update();
  }
  // searching for products
  final TextEditingController searchingtext = TextEditingController();
  List<dynamic>? searchingData; // Filtered data
  void updateSearch( String query ) {
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

}
class SelectPage extends GetxController {

  int currentPageIndex = 0 ;
  void getSelectedPage( int index ) {
    switch (index) {
      case 0:
         break;
      case 1:
         Get.to( () => const Mycaed()) ; 
        break;
      case 2:
         Get.to( () => const Myfavourite());
         break;
      case 3:
         Get.to( () => const Myaccount()) ;
         break;
      default:
         const Text('Home Page');
         break;
    }
  }
}
