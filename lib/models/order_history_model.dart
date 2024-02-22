// To parse this JSON data, do
//
//     final orderHistoryModel = orderHistoryModelFromJson(jsonString);

import 'dart:convert';

List<OrderHistoryModel> orderHistoryModelFromJson(String str) => List<OrderHistoryModel>.from(json.decode(str).map((x) => OrderHistoryModel.fromJson(x)));

String orderHistoryModelToJson(List<OrderHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderHistoryModel {
    final int? orderId;
    final String? noOfBottles;
    final int? customerId;
    final String? userName;

    OrderHistoryModel({
        this.orderId,
        this.noOfBottles,
        this.customerId,
        this.userName,
    });

    OrderHistoryModel copyWith({
        int? orderId,
        String? noOfBottles,
        int? customerId,
        String? userName,
    }) => 
        OrderHistoryModel(
            orderId: orderId ?? this.orderId,
            noOfBottles: noOfBottles ?? this.noOfBottles,
            customerId: customerId ?? this.customerId,
            userName: userName ?? this.userName,
        );

    factory OrderHistoryModel.fromJson(Map<String, dynamic> json) => OrderHistoryModel(
        orderId: json["order_id"],
        noOfBottles: json["no_of_bottles"],
        customerId: json["customer_id"],
        userName: json["user_name"],
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "no_of_bottles": noOfBottles,
        "customer_id": customerId,
        "user_name": userName,
    };
}
