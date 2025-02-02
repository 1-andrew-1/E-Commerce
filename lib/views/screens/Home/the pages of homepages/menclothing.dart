import 'package:flutter/material.dart';
import 'package:furitshop/views/screens/cardwidget/widget/card_widget.dart';
import 'package:furitshop/controller/homecontroller.dart';
import 'package:get/get.dart';

class Menclothing extends StatelessWidget {
  const Menclothing ({super.key});

  @override
  Widget build(BuildContext context) {
    final Homecontroller _HomeController = Get.put(Homecontroller());
    return GetBuilder<Homecontroller>(builder: (controller) {
      if (_HomeController.data == null || _HomeController.data!.isEmpty) {
        return Center(
          child: Text('No products available'),
        );
      }
      return GridView.builder(
        shrinkWrap: true, // Add this to constrain GridView
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0, // Horizontal spacing
          mainAxisSpacing: 10.0, // Vertical spacing
          childAspectRatio: 0.8, // Width-to-height ratio of each grid item
        ),
          itemCount: _HomeController.data?.length,
          itemBuilder: (context, index) {
            var data = _HomeController.data![index];
            var rate = data["rating"]["rate"] ;
            //print(rate) ;
            if ( data["category"] == "men's clothing") {
             return 
             Cardwidgt(
                photo: "${data["image"]}",
                title: "${data["title"]}",
                price: "${data["price"]}", 
                rating: rate.toDouble(), 
                id: data["id"], index: index,);
            }else {
              return null;
            }
          });
    });
  }
}