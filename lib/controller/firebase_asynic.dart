import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAsync extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // ✅ Observable List to store orders
  var orderList = <Map<String, dynamic>>[].obs;

  // ✅ Get Current User UID
  String getCurrentUserUID() {
    return FirebaseAuth.instance.currentUser?.uid ?? '';
  }

  // ✅ Update User's  Favorites in Firestore
  Future<void> updateUserFavorites({
    required List<dynamic> favorite,
  }) async {
    String userUID = getCurrentUserUID();
    if (userUID.isEmpty){
      return; // Ensure user is logged in
    } 
    try {
      await _firestore.collection('users').doc(userUID).set({
        'Favourite': favorite,
      }, SetOptions(merge: true)); // Merge to avoid overwriting existing data
      print("Cart & Favorites updated successfully!");
    } catch (e) {
      print("Error updating cart & favorites: $e");
    }
  }
  // ✅ Update User's Cart  in Firestore
  Future<void> updateUserCart({
    required List<dynamic> cart,
  }) async {
    String userUID = getCurrentUserUID();
    if (userUID.isEmpty){
      return; // Ensure user is logged in
    } 
    try {
      await _firestore.collection('users').doc(userUID).set({
        'Cart': cart,
      }, SetOptions(merge: true)); // Merge to avoid overwriting existing data
      print("Cart & Favorites updated successfully!");
    } catch (e) {
      print("Error updating cart & favorites: $e");
    }
  }

   
  List<Map<String, dynamic>> showOrder = []; // ✅ Maintain proper typing

  // ✅ Fetch User's Orders from Firestore
  Future<void> fetchUserOrders() async {
    String userUID = getCurrentUserUID();
    if (userUID.isEmpty) return;

    try {
      var querySnapshot = await _firestore
          .collection('users')
          .doc(userUID)
          .collection('orders')
          .get();
      // ✅ Correctly update `showOrder`
      showOrder = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      update(); // ✅ Notify GetX to update UI

      print("Orders loaded successfully! Total Orders: ${showOrder.length}");
    } catch (e) {
      print("Error fetching orders: $e");
    }

    print("Fetched Orders: $showOrder"); // ✅ Prints fetched orders clearly
  }

  // ✅ Place an Order
  Future<void> sendOrderToFirestore({
    required List<dynamic> newOrder,
  }) async {
    String userUID = getCurrentUserUID();
    if (userUID.isEmpty) return; // Ensure user is logged in

    try {
      await _firestore.collection('users').doc(userUID).set({
        'orders': newOrder,
      }, SetOptions(merge: true));;
      //await fetchUserOrders(); // Refresh orders after adding a new one
      print("Order placed successfully!");
    } catch (e) {
      print("Error placing order: $e");
    }
  }
}
