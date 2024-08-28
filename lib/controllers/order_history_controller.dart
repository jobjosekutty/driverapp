// ignore_for_file: avoid_print

import 'package:driverapp/models/order_history_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderHistoryController extends GetxController {
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  List<OrderHistoryModel> dataItem = [];
  bool loading = false;

  fetchData() async {
    loading = true;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");
    final http.Response response = await http.get(
      Uri.parse('https://hayawater.test-services.site/api/order/history/lists/$auth'),
    );
    print("=====>>history${response.body}");
    var data = orderHistoryModelFromJson(response.body);
    dataItem = data;
    loading = false;
    update();
  }
}
