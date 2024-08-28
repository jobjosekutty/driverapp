// ignore_for_file: avoid_print

import 'package:driverapp/models/order_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  bool loading = false;

  List<OrderModel> dataItem = [];

  fetchData() async {
    loading = true;
    print("yess");
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");

    final http.Response response = await http.get(
      Uri.parse('https://hayawater.test-services.site/api/order/pending/lists/$auth'),
    );
    print("====>${response.body}");
    print("====>${response.statusCode}");
    var data = orderModelFromJson(response.body);
    dataItem = data;
    loading = false;
    update();
  }
}
