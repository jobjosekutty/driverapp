// ignore_for_file: avoid_print

import 'package:driverapp/screens/home_screen.dart';
import 'package:driverapp/screens/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    Future.delayed(const Duration(milliseconds: 3000), () {
      var auth = preferences.getString("token");
      print("===>$auth");
      if (auth != null && auth.toLowerCase().isNotEmpty) {
        Get.off(Home());
      } else {
        Get.off(LoginScreen());
      }
    });
  }
}
