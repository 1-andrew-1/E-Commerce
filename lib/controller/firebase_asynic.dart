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

  // ✅ Fetch User's Cart & Favorites
  Future<Map<String, dynamic>> getUserCartAndFavorites() async {
    String userUID = getCurrentUserUID();
    if (userUID.isEmpty) return {}; // Ensure user is logged in

    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(userUID).get();
      return doc.exists ? doc.data() as Map<String, dynamic> : {};
    } catch (e) {
      print("Error fetching cart & favorites: $e");
      return {};
    }
  }

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

      // Update `orderList` reactively
      orderList.assignAll(querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>));
      update(); // Notify GetX to update UI
      print("Orders loaded successfully!");
    } catch (e) {
      print("Error fetching orders: $e");
    }
  }

  // ✅ Place an Order
  Future<void> sendOrderToFirestore({
    required Map<String, dynamic> newOrder,
  }) async {
    String userUID = getCurrentUserUID();
    if (userUID.isEmpty) return; // Ensure user is logged in

    try {
      await _firestore.collection('users').doc(userUID).collection('orders').add(newOrder);
      await fetchUserOrders(); // Refresh orders after adding a new one
      print("Order placed successfully!");
    } catch (e) {
      print("Error placing order: $e");
    }
  }
}
