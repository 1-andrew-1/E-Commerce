import 'package:flutter/material.dart';
import 'package:furitshop/UI/views/home/controller/homecontroller.dart';
import 'package:furitshop/UI/views/cardwidget/widget/card_widget.dart';
import 'package:get/get.dart';

class Menpage extends StatelessWidget {
  Menpage({super.key});
  final Homecontroller _HomeController = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Homecontroller>(builder: (controller) {
        final dataToShow =
            _HomeController.searchingData ?? _HomeController.data;

        if (dataToShow == null || dataToShow.isEmpty) {
          return Center(
            child: Text('No products match your search.'),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.8,
          ),
          itemCount: dataToShow.length,
          itemBuilder: (context, index) {
            var data = dataToShow[index];
            var rate = data["rating"]["rate"];
            return Cardwidgt(
              photo: "${data["image"]}",
              title: "${data["title"]}",
              price: "${data["price"]}",
              rating: rate.toDouble(),
              id: data["id"],
              index: index,
            );
          },
        );
      }),
    );
  }
}
