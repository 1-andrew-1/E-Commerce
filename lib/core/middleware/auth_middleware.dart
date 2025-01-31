import 'package:flutter/widgets.dart';
import 'package:furitshop/core/services/services_setting.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  ServicesSetting controller = Get.put(ServicesSetting());
  @override
  RouteSettings? redirect (String? route) {
    if ( controller.islogging == true ) {
       return const RouteSettings(name: '/home' );
    }else {
      return const RouteSettings(name: '/padeview' );
    }
  }
}
