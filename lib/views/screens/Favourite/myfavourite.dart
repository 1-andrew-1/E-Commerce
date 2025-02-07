import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furitshop/controller/firebase_asynic.dart';
import 'package:furitshop/views/screens/cardwidget/widget/card_widget.dart';
import 'package:furitshop/views/screens/cart/card%20count/emptyscreen.dart';
import 'package:furitshop/controller/homecontroller.dart';
import 'package:get/get.dart';

class Myfavourite extends StatelessWidget {
  const Myfavourite({super.key});
  
  @override
  Widget build(BuildContext context) {
    final Homecontroller controller = Get.put(Homecontroller());
    final FirebaseAsync firebaseAsync = Get.put(FirebaseAsync());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Favourite',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,

        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Custom back icon
          onPressed: ()  {
            firebaseAsync.updateUserFavorites(
               favorite: controller.favorite );
              Future.delayed(Duration(seconds: 2)) ;
            Get.back(); // Go back using GetX
          },
        ),
      ),
      body: Obx(() {
        return controller.favorite.isEmpty
            ? EmptyCartScreen(
                imageName: "images/concept-illustration_878233-2270.png",
                title: "No Favorites",
                subTitle:
                    "You can add an item to your favorites by clicking the \"⭐ Star icon\"",
                buttonText: "Go Back",
                onButtonPressed: () {
                  Get.back();
                })
            : Column(
                children: [
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                          itemCount: controller.favorite
                              .length, // Use the length of your data list to show all items.
                          itemBuilder: (context, index) {
                            int count = controller.favorite[index].value;
                            var data = controller.data![count - 1];
                            var rate = data["rating"]["rate"];
                            return Cardwidgt(
                              photo: "${data["image"]}",
                              title: "${data["title"]}",
                              price: "${data["price"]}",
                              rating: rate.toDouble(),
                              id: data["id"],
                              index: index,
                            );
                          }),
                    ),
                  )
                ],
              );
      }),
    );
  }
}
