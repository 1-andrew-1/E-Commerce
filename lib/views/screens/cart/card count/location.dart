import 'package:flutter/material.dart';
import 'package:furitshop/controller/order.dart';
import 'package:get/get.dart';

class Location extends StatelessWidget {
  Location({super.key});

  final ValueNotifier<String> selectedCity = ValueNotifier<String>("الإسكندرية");

  final Ordercontroller order = Get.put(Ordercontroller()) ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ValueListenableBuilder(
          valueListenable: selectedCity,
          builder: (context, city, child) {
            return Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 5),
                ValueListenableBuilder(
                  valueListenable: selectedCity,
                  builder: (context, pincode, child) {
                    return Text( city, style: TextStyle(fontSize: 16));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () => _selectCity(context),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  void _selectCity(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 250,
        child: SingleChildScrollView(
          child: Column(
            children: order.cities.map((city) {
              return ListTile(
                title: Text(city),
                onTap: () {
                  selectedCity.value = city;
                  order.citiesName = city ;
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
