import 'package:flutter/material.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';
import 'package:furitshop/views/screens/log/login.dart';
import 'package:furitshop/views/screens/splash%20view%F0%9F%A4%A6%E2%80%8D%E2%99%80%EF%B8%8F/splash_view/custom_padge_view.dart';
import 'package:furitshop/views/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  final _controler = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  void initState() {
    _controler.addListener(() {
      setState(() {
        _currentPage = _controler.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Sizeconig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Custompageview(
            pageController: _controler,
          ),
          Visibility(
            visible: _currentPage != 2,
            child: Positioned(
              top: Sizeconig.defaultsize! * 10,
              right: Sizeconig.defaultsize! * 2,
              child: TextButton(
                onPressed: () {
                  Get.off(() => const Login() , transition: Transition.cupertino);
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xff898989),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: Sizeconig.defaultsize! * 10,
            left: Sizeconig.defaultsize! * 13,
            right: Sizeconig.defaultsize! * 13,
            child: Customglobelbutton(
              buttonname: _currentPage != 2 ? 'Next' : 'Get started',
              onPressed: () {
                if (_currentPage != 2) {
                  _controler.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }else {
                  Get.off(() => const Login() , transition: Transition.fadeIn);
                }
              },
            ),
          ),
          Positioned(
              bottom: Sizeconig.defaultsize! * 22,
              left: Sizeconig.defaultsize! * 17.5,
              right: Sizeconig.defaultsize! * 17.5,
              child: SmoothPageIndicator(
                controller: _controler,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: const WormEffect(
                  dotColor: Color(0xFFB9B4C7),
                  activeDotColor: Color(0xFFFABC3F),
                ),
              )),
        ],
      ),
    );
  }
}
