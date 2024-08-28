// ignore_for_file: avoid_print

import 'package:driverapp/constants/app_theme.dart';
import 'package:driverapp/models/profile_model.dart';
import 'package:driverapp/screens/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    fetchData();

    super.onInit();
  }

  ProfileModel? dataitem;
  bool loading = false;

  fetchData() async {
    loading = true;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");
    print("===???$auth");
    final http.Response response = await http.get(
      Uri.parse('https://hayawater.test-services.site/api/driver/profile/$auth'),
    );
    var data = profileModelFromJson(response.body);
    dataitem = data;
    loading = false;
    update();
  }

  logout() async {
    loading = true;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");
    print("===???$auth");
    final http.Response response = await http.get(
      Uri.parse('https://hayawater.test-services.site/api/driver/logout/$auth'),
    );
    print(response.body);
    if (response.statusCode == 200) {
      preferences.setString("token", '');
      Get.offAll(LoginScreen());
      Fluttertoast.showToast(
          backgroundColor: AppColors.green1,
          msg: "Logout Successfully",
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
