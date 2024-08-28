// ignore_for_file: avoid_print

import 'package:driverapp/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/order_details_model.dart';

class OrderDetailsController extends GetxController {
  OrderDetailsModel? dataItem;
  fetchData(int? id) async {
    print("===>id$id");
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");
    final http.Response response = await http.get(
      Uri.parse('https://hayawater.test-services.site/api/order/detail/$id/$auth'),
    );
    print(response.body);
    print(response.statusCode);
    var data = orderDetailsModelFromJson(response.body);
    dataItem = data;

    update();
  }

  statusUpdate(int? id, String? status) async {
    print(id);
    print(status);
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");
    //  final responses = await Future.wait([
    //   http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')),
    //   http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/2')),

    // ]);
    //  for (final response in responses) {
    //   final data = json.decode(response.body);
    //   print('Title: ${data['title']}');
    // }
    final http.Response response = await http.get(
      Uri.parse(
          'https://hayawater.test-services.site/api/order/statusupdate/$id/$auth/$status'),
    );
    print("statusupdate");
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.offAll(Home());
    }
    update();
  }
}
