import 'package:driverapp/models/history_details_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HistoryDetailsController extends GetxController {
  HistoryDetailsModel? dataItem;
  fetchData(int? id) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");

    final http.Response response = await http.get(
      Uri.parse('http://68.178.175.87/api/order/detail/${id}/${auth}'),
    );
    print(response.body);
    print(response.statusCode);
    var data = historyDetailsModelFromJson(response.body);
    dataItem = data;
    update();
  }
}
