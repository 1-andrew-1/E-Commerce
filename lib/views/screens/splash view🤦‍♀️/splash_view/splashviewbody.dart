import 'package:flutter/material.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';
import 'package:furitshop/core/services/services_setting.dart';
import 'package:furitshop/views/screens/Home/homepage.dart';
import 'package:furitshop/views/screens/splash%20view%F0%9F%A4%A6%E2%80%8D%E2%99%80%EF%B8%8F/padgeview/padge_view.dart';
import 'package:get/get.dart';

class Splashviewbody extends StatefulWidget {
  const Splashviewbody({super.key});

  @override
  State<Splashviewbody> createState() => _SplashviewbodyState();
}

class _SplashviewbodyState extends State<Splashviewbody>
  with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? scaleanimation;
  bool check = false ;
  ServicesSetting controller = Get.put(ServicesSetting());
  void navagator () async {
      await Future.delayed( const Duration(seconds: 4) ) ;

      if (  controller.islogging == false ) {
        Get.off( () => const NextPage() , transition: Transition.fade ) ;
      }else {
        Get.off( () =>  Homepage(), transition: Transition.fade );
      }
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    scaleanimation =
        Tween<double>(begin: 0.2, end: 1.0).animate(animationController!);
    animationController!.repeat(reverse: true);
    navagator() ;
  }
  
  @override
  Widget build(BuildContext context) {
    Sizeconig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFF222831),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          AnimatedBuilder(
              animation: animationController!,
              builder: (context, _) => Opacity(
                    opacity: scaleanimation!.value,
                    child:  const Text(
                      'El-Shaikh Marzouk Market',
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 34 ,
                          fontWeight: FontWeight.w800,
                          color: Colors.amber),
                        textAlign: TextAlign.center,
                    ),
                  )),
           SizedBox(height: Sizeconig.defaultsize! * .001  ),
          Expanded(child: Image.asset('images/promotion.png' , height: Sizeconig.defaultsize! * 20, )),
        ],
      ),
    );
  }
}
