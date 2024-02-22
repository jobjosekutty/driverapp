// To parse this JSON data, do
//
//     final historyDetailsModel = historyDetailsModelFromJson(jsonString);

import 'dart:convert';

HistoryDetailsModel historyDetailsModelFromJson(String str) =>
    HistoryDetailsModel.fromJson(json.decode(str));

String historyDetailsModelToJson(HistoryDetailsModel data) =>
    json.encode(data.toJson());

class HistoryDetailsModel {
  final int? orderId;
  final String? noOfBottles;
  final String? orderDate;
  final String? orderStatus;
  final String? assignedDate;
  final int? customerId;
  final String? userName;
  final String? emirates;
  final String? area;
  final dynamic building;
  final dynamic flat;

  HistoryDetailsModel({
    this.orderId,
    this.noOfBottles,
    this.orderDate,
    this.orderStatus,
    this.assignedDate,
    this.customerId,
    this.userName,
    this.emirates,
    this.area,
    this.building,
    this.flat,
  });

  HistoryDetailsModel copyWith({
    int? orderId,
    String? noOfBottles,
    String? orderDate,
    String? orderStatus,
    String? assignedDate,
    int? customerId,
    String? userName,
    String? emirates,
    String? area,
    dynamic building,
    dynamic flat,
  }) =>
      HistoryDetailsModel(
        orderId: orderId ?? this.orderId,
        noOfBottles: noOfBottles ?? this.noOfBottles,
        orderDate: orderDate ?? this.orderDate,
        orderStatus: orderStatus ?? this.orderStatus,
        assignedDate: assignedDate ?? this.assignedDate,
        customerId: customerId ?? this.customerId,
        userName: userName ?? this.userName,
        emirates: emirates ?? this.emirates,
        area: area ?? this.area,
        building: building ?? this.building,
        flat: flat ?? this.flat,
      );

  factory HistoryDetailsModel.fromJson(Map<String, dynamic> json) =>
      HistoryDetailsModel(
        orderId: json["order_id"],
        noOfBottles: json["no_of_bottles"],
        orderDate: json["order_date"],
        orderStatus: json["order_status"],
        assignedDate: json["assigned_date"],
        customerId: json["customer_id"],
        userName: json["user_name"],
        emirates: json["emirates"],
        area: json["area"],
        building: json["building"],
        flat: json["flat"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "no_of_bottles": noOfBottles,
        "order_date": orderDate,
        "order_status": orderStatus,
        "assigned_date": assignedDate,
        "customer_id": customerId,
        "user_name": userName,
        "emirates": emirates,
        "area": area,
        "building": building,
        "flat": flat,
      };
}
