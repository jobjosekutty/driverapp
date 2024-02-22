// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

List<OrderModel> orderModelFromJson(String str) => List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModel {
    final int? orderId;
    final String? noOfBottles;
    final int? customerId;
    final String? userName;

    OrderModel({
        this.orderId,
        this.noOfBottles,
        this.customerId,
        this.userName,
    });

    OrderModel copyWith({
        int? orderId,
        String? noOfBottles,
        int? customerId,
        String? userName,
    }) => 
        OrderModel(
            orderId: orderId ?? this.orderId,
            noOfBottles: noOfBottles ?? this.noOfBottles,
            customerId: customerId ?? this.customerId,
            userName: userName ?? this.userName,
        );

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
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
