import 'package:flutter/material.dart';
import 'package:furitshop/views/themes/appstyle.dart';
import 'package:furitshop/controller/homecontroller.dart';
import 'package:furitshop/views/widgets/addtocartbutton.dart';
import 'package:furitshop/views/widgets/photo_widget.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';
import 'package:get/get.dart';

class Detail extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const Detail({super.key, required this.ID});
  // ignore: non_constant_identifier_names
  final int ID ;
  
  @override
  Widget build(BuildContext context) {
    final Homecontroller homecontroller = Get.put(Homecontroller()) ;
    var showing = homecontroller.data?[ID] ;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [ 
              PhotoWidget(photo: "${showing["image"]}"),
               Text( showing["title"] , style: Appstyle().titledetailStyle,),
               Padding(
                 padding: const EdgeInsets.only(right: 30,),
                 child: Divider( height: 40,),
               ),
               Text( "* ${showing["description"]}" , style: Appstyle().descriptStyle,),
               
               Padding(
                 padding:  EdgeInsets.only(
                  top: Sizeconig.defaultsize! *3 ,
                  bottom: Sizeconig.defaultsize! * 3,
                 ),
                 child: Center(child: Text( "* Price: ¶ ${showing["price"]}" , style: Appstyle().priceStyle,)),
               ),
               Addtocartbutton(
                onPressed: () {
                  homecontroller.addToCart(ID); // Perform add-to-cart action

                  // Show success message using GetX Snackbar
                  Get.snackbar(
                    'Success', // Title
                    'Added Successfully!', // Message
                    snackPosition: SnackPosition.BOTTOM, // Position of the Snackbar
                    duration: Duration(seconds: 3), // How long it will appear
                    backgroundColor: Colors.green.withOpacity(0.7), // Background color
                    colorText: Colors.white, // Text color
                    borderRadius: 10, // Rounded corners
                    margin: EdgeInsets.all(10), // Margin from screen edges
                  );

                  // Navigate back to Homepage
                  // Get.off(()=>Homepage()); // Corrected this line

                }, text: 'Add to Cart', iconData: Icons.shopping_cart,
               ),
            ],
          ),
        ),
      )
    );
  }
}