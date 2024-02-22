import 'package:driverapp/constants/app_constant.dart';
import 'package:driverapp/constants/app_theme.dart';
import 'package:driverapp/controllers/order_history_controller.dart';
import 'package:driverapp/screens/history_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  OrderHistoryController orderHistoryController =
      Get.put(OrderHistoryController());
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbar,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.grey6,
        ),
        title: Text(
          "History",
          style: TextStyle(color: AppColors.white),
        ),
      ),
      backgroundColor: AppColors.darkScaffold,
      body: GetBuilder<OrderHistoryController>(
        builder: (controller) {
          if (orderHistoryController.loading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.green1,
              ),
            );
          }
          return SmartRefresher(
            controller: refreshController,
            onRefresh: () {
              orderHistoryController.fetchData();
              refreshController.refreshCompleted();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderHistoryController.dataItem.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.grey1,
                                AppColors.grey1.withOpacity(0.5),
                                AppColors.grey1.withOpacity(0.2),
                              ],
                            ),
                            color: AppColors.grey1,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 1,
                              color: AppColors.grey2,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.orange,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      "Delivered",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.grey2,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      "UserName:${orderHistoryController.dataItem[index].userName}",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              setHeight(16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "No of Bottles :${orderHistoryController.dataItem[index].noOfBottles}",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              setHeight(16),
                              Row(
                                children: [
                                  Expanded(
                                    child: CupertinoButton(
                                      color: AppColors.green1,
                                      child: const Text("View Details"),
                                      onPressed: () {
                                        Get.to(HistoryDetails(
                                            id: orderHistoryController
                                                .dataItem[index].orderId));
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
