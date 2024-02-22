// ignore_for_file: avoid_print

import 'package:driverapp/constants/app_theme.dart';
import 'package:driverapp/models/login_model.dart';
import 'package:driverapp/screens/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  bool loading = false;
  login(String username, String password) async {
    loading = true;
    update();
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var body = {'username': '9562505894', 'password': 'qwerty'};
    final http.Response response = await http.post(
      Uri.parse('http://68.178.175.87/api/driver/login'),
      body: body,
    );
    print('///////////sc${response.statusCode}');
    print(response.body);

    var data = loginModelFromJson(response.body);
    print(data.data?.apiToken);
    var token = data.data?.apiToken;

    if (response.statusCode == 200) {
      print("object");
      preferences.setString("token", token!);
      Get.offAll(Home());
      Fluttertoast.showToast(
          backgroundColor: AppColors.green1,
          msg: "Login Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          textColor: AppColors.white,
          fontSize: 16.0);
    } else if (response.statusCode == 404) {
      Fluttertoast.showToast(
          backgroundColor: AppColors.red,
          msg: "Login Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          textColor: AppColors.white,
          fontSize: 16.0);
    }
    loading = false;
    update();
  }
}
