import 'package:flutter/material.dart';
import 'package:furitshop/UI/views/cardwidget/widget/card_widget.dart';
import 'package:furitshop/UI/views/cart/card%20count/emptyscreen.dart';
import 'package:furitshop/UI/views/home/controller/homecontroller.dart';
import 'package:get/get.dart';

class Myfavourite extends StatelessWidget {
  const Myfavourite({super.key});

  @override
  Widget build(BuildContext context) {
    final Homecontroller controller = Get.put(Homecontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favourite' , style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Obx(
         () {
          return controller.favorite.isEmpty ? 
            EmptyCartScreen(
              imageName: "images/concept-illustration_878233-2270.png", 
              title: "No Favorites", 
              subTitle: "You can add an item to your favorites by clicking the \"⭐ Star icon\"", 
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
                          int count =controller.favorite[index].value ; 
                          var data = controller.data![count-1];
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
        }
      ),
    );
  }
}
