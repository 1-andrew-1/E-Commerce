import 'package:flutter/material.dart';
import 'package:furitshop/views/screens/Home/bottonnavigarion.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});
  // ignore: non_constant_identifier_names
  final int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3));
    return Scaffold(
       bottomNavigationBar:  const BottomNavigation () ,
    );
  }
}
