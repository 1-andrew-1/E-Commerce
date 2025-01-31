import 'package:flutter/material.dart';
import 'package:furitshop/UI/views/home/controller/homecontroller.dart';
import 'package:furitshop/UI/views/home/homepagebody.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final SelectPage controller = Get.put(SelectPage()) ;
  final Homecontroller _homecontroller = Get.put(Homecontroller()) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
            controller.getSelectedPage(index);
        },
        indicatorColor: Colors.amber,
        selectedIndex: controller.currentPageIndex,
        destinations:  <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          Obx( () =>
          NavigationDestination(
              icon:  Badge(
                isLabelVisible: _homecontroller.cart.isEmpty ? false : true ,
                child: Icon(
                   Icons.shopping_cart,
                ),
              ),
              label: 'Shopping Cart',
            ),
          ),
          Obx( () => 
          NavigationDestination(
            icon: Badge(
              isLabelVisible: _homecontroller.favorite.isEmpty ? false : true ,
              child: Icon(Icons.favorite),
            ),
            label: 'Favorites',
          ),
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: false,
              child: Icon(
                Icons.person,
              ),
            ),
            label: 'My Account',
          ),
        ],
      ),
      body: const Homepagebody() ,
    );
  }

  // Method to get the selected page based on the index
  
}
