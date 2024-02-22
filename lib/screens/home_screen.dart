import 'package:driverapp/constants/app_constant.dart';
import 'package:driverapp/constants/app_theme.dart';
import 'package:driverapp/controllers/home_controller.dart';
import 'package:driverapp/screens/order_details.dart';
import 'package:driverapp/screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  HomeController homeController = Get.put(HomeController());
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkScaffold,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(Settings());
          },
          icon: Icon(
            Icons.menu,
            color: AppColors.grey6,
          ),
        ),
        backgroundColor: AppColors.appbar,
        title: Text(
          "Live Task",
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          if (homeController.loading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.green1,
              ),
            );
          }
          if (homeController.dataItem.isEmpty) {
            return SmartRefresher(
              controller: refreshController,
              onRefresh: () async {
                homeController.fetchData();
                refreshController.refreshCompleted();
              },
              child: Center(
                child: Text(
                  "No Orders Found",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }
          return SmartRefresher(
            controller: refreshController,
            onRefresh: () async {
              homeController.fetchData();
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
                      itemCount: homeController.dataItem.length,
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
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                    ),
                                    child: Text(
                                      "No of Bottles:5",
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
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
                                      "ClientName:${homeController.dataItem[index].userName}",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              setHeight(16),
                              Lottie.asset(
                                'assets/order_progress.json',
                              ),
                              setHeight(16),
                              Row(
                                children: [
                                  Expanded(
                                    child: CupertinoButton(
                                      onPressed: () {
                                        Get.to(OrderDeatils(
                                            id: homeController
                                                .dataItem[index].orderId));
                                      },
                                      color: AppColors.green1,
                                      child: const Text("Order Details"),
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
