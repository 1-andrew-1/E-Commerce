import 'package:flutter/material.dart';
import 'package:furitshop/controller/homecontroller.dart';
import 'package:furitshop/views/screens/Home/homepagebody.dart';
import 'package:furitshop/views/widgets/loading_screen.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    final SelectPage controller = Get.put(SelectPage()) ;
    final Homecontroller _homecontroller = Get.put(Homecontroller()) ;
    _homecontroller.getproduct() ;
    _homecontroller.loading_screen();
    return Obx(
       () =>
        _homecontroller.isfetched.value ? LoadingScreen()  :
          Scaffold(
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
        )
    );
  }
}
