import 'package:flutter/material.dart';
import 'package:furitshop/controller/homecontroller.dart';
import 'package:get/get.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';

class CartWidgt extends StatefulWidget {
  const CartWidgt({
    super.key,
    required this.photo,
    required this.title,
    required this.price,
    required this.rating,
    required this.id,
    required this.index,
  });
  final String photo;
  final String title;
  final String price;
  final double rating;
  final int id;
  final int index;

  @override
  State<CartWidgt> createState() => _CartWidgtState();
}

class _CartWidgtState extends State<CartWidgt> {
  final Homecontroller contr = Get.put(Homecontroller()) ;
  // Initialize quantity to 1
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Get.to(() => Detail(ID: widget.index));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.photo,
                    height: Sizeconig.defaultsize! * 10,
                    width: Sizeconig.defaultsize! * 10,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Title
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      // Rating
                      Row(
                        children: List.generate(
                          widget.rating.toInt(),
                          (index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Quantity and Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Quantity Counter
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, color: Colors.red),
                                onPressed: () {
                                    if (contr.cart[widget.index]['quantity'].value > 1) {
                                       contr.cart[widget.index]['quantity'].value --;
                                       contr.updateQuantity(widget.index, contr.cart[widget.index]['quantity'].value );
                                    }
                                },
                              ),
                            Obx( () => Text(
                                contr.cart[widget.index]['quantity'].value .toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                              IconButton(
                                icon: const Icon(Icons.add, color: Colors.green),
                                onPressed: () {
                                    contr.cart[widget.index]['quantity'].value ++;
                                    contr.updateQuantity(widget.index, contr.cart[widget.index]['quantity'].value );
                                },
                              ),
                            ],
                          ),
                        Obx( () =>  // Price
                          Text(
                            "\$${(double.parse(widget.price) * contr.cart[widget.index]['quantity'].value ).toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              contr.cart.removeAt(widget.index);
                            },
                          ),
                        
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// the code 
/*
import 'package:flutter/material.dart';
import 'package:furitshop/UI/views/cardwidget/widget/cardw.dart';
import 'package:furitshop/UI/views/cardwidget/widget/photo.dart';
import 'package:furitshop/UI/views/cardwidget/widget/price.dart';
import 'package:furitshop/UI/views/cardwidget/widget/rating.dart';
import 'package:furitshop/UI/views/cardwidget/widget/title.dart';
import 'package:furitshop/UI/views/cart/card%20count/count.dart';
import 'package:furitshop/UI/views/home/detials/detail.dart';
import 'package:furitshop/features/widget/widget/sizeconig.dart';
import 'package:get/get.dart';

class CartWidgt extends StatefulWidget {
  const CartWidgt({
    super.key,
    required this.photo,
    required this.title,
    required this.price,
    required this.rating,
    required this.id,
    required this.index,
  });
  final String photo;
  final String title;
  final String price;
  final double rating;
  final int id;
  final int index;

  @override
  State<CartWidgt> createState() => _CartWidgtState();
}

class _CartWidgtState extends State<CartWidgt> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => Detail(ID: widget.index));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
            height: Sizeconig.defaultsize! * 22,
            width: Sizeconig.defaultsize! * 15,
            child: CardW(
              child: Stack(
              children: [
                Positioned(
                  top: Sizeconig.defaultsize! * 1.8,
                  left: Sizeconig.defaultsize! * 2.5,
                  child: Photo(phot: widget.photo)),

                Positioned(
                  top: Sizeconig.defaultsize! * 1.8,
                  right: Sizeconig.defaultsize! * 1.2,
                  child: Count(id: widget.index)),

                  Positioned(
                    top: Sizeconig.defaultsize! * 14,
                    left: Sizeconig.defaultsize! * 3.5,
                    child: RatingWidget(
                      rating: widget.rating,)),

                    Positioned(
                    top: Sizeconig.defaultsize! * 16.6,
                     left: Sizeconig.defaultsize! * 1,
                     right: Sizeconig.defaultsize! * 1,
                    child: TitleW(
                      title: widget.title,)),
                      
                    Positioned(
                    top: Sizeconig.defaultsize! * 18.9,
                    left: Sizeconig.defaultsize! * 1,
                    right: Sizeconig.defaultsize! * 1,
                    child: Price(
                      price: widget.price,)),
              ],
            ))),
      ),
    );
  }
}
*/



