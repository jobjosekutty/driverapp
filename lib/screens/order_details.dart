import 'package:driverapp/constants/app_constant.dart';
import 'package:driverapp/constants/app_theme.dart';
import 'package:driverapp/controllers/order_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDeatils extends StatefulWidget {
  const OrderDeatils({super.key, required this.id});
  final int? id;

  @override
  State<OrderDeatils> createState() => _OrderDeatilsState();
}

class _OrderDeatilsState extends State<OrderDeatils> {
  OrderDetailsController orderDetailsController =
      Get.put(OrderDetailsController());
  @override
  void initState() {
    orderDetailsController.fetchData(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkScaffold,
      body: GetBuilder<OrderDetailsController>(
        builder: (controller) {
          if (orderDetailsController.dataItem?.orderStatus == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar.medium(
                backgroundColor: AppColors.appbar,
                iconTheme: IconThemeData(
                  color: AppColors.grey6,
                ),
                title: Text(
                  'Order Details',
                  style: appTextStyle(
                      fontWeight: FontWeight.w600, color: AppColors.white),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              setHeight(8),
                              Text(
                                "Delivery Location",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.orange,
                                  fontSize: 16,
                                ),
                              ),
                              setHeight(4),
                              Text(
                                "Al Takhassousi, Al Mohammadiyyah,\n Qads 19282",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                          // const Spacer(),
                          // Container(
                          //   padding: const EdgeInsets.all(4),
                          //   decoration: BoxDecoration(
                          //     color: AppColors.blue1,
                          //     shape: BoxShape.circle,
                          //   ),
                          //   child: Icon(
                          //     Icons.directions,
                          //     color: AppColors.grey6,
                          //   ),
                          // ),
                        ],
                      ),
                      const Divider(),
                      Text(
                        "Contact to Customer",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: AppColors.orange,
                          fontSize: 16,
                        ),
                      ),
                      setHeight(8),
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoButton(
                              onPressed: () {},
                              color: AppColors.green1,
                              child: const Text("Call"),
                            ),
                          ),
                          setWidth(4),
                          // CupertinoButton(
                          //   onPressed: () {},
                          //   color: AppColors.green1,
                          //   child: const Text("Whatsup"),
                          // ),
                        ],
                      ),
                      setHeight(8),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.grey1,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order Details",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.orange,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "No of Bottle",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${orderDetailsController.dataItem?.noOfBottles}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              setHeight(4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Order Date',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${orderDetailsController.dataItem?.orderDate}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              setHeight(4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Assigned Date",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${orderDetailsController.dataItem?.assignedDate}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "User Name",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${orderDetailsController.dataItem?.userName}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Emirates",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${orderDetailsController.dataItem?.emirates}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Area",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${orderDetailsController.dataItem?.area}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Building No",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${orderDetailsController.dataItem?.building}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Flat",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${orderDetailsController.dataItem?.flat}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      setHeight(16),
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoButton(
                              onPressed: () {
                                orderDetailsController.statusUpdate(
                                    orderDetailsController.dataItem?.orderId,
                                    'Delivered');
                              },
                              color: AppColors.blue1,
                              child: Text("Make Delivery"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
