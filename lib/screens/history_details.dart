import 'package:driverapp/constants/app_constant.dart';
import 'package:driverapp/constants/app_theme.dart';
import 'package:driverapp/controllers/history_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryDetails extends StatefulWidget {
  HistoryDetails({super.key, required this.id});

  final int? id;

  @override
  State<HistoryDetails> createState() => _HistoryDetailsState();
}

class _HistoryDetailsState extends State<HistoryDetails> {
  HistoryDetailsController historyDetailsController =
      Get.put(HistoryDetailsController());
  @override
  void initState() {
    historyDetailsController.fetchData(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkScaffold,
      body: GetBuilder<HistoryDetailsController>(
        builder: (controller) {
          if (historyDetailsController.dataItem?.noOfBottles == null) {
            return Center(
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
                  'Order History Details',
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
                                "Order History Details",
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
                                    '${historyDetailsController.dataItem?.noOfBottles}',
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
                                    '${historyDetailsController.dataItem?.orderDate}',
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
                                    '${historyDetailsController.dataItem?.assignedDate}',
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
                                    "Order Status",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${historyDetailsController.dataItem?.orderStatus}',
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
                                    "User Name",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${historyDetailsController.dataItem?.userName}',
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
                                    "Emirates",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${historyDetailsController.dataItem?.emirates}',
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
                                    '${historyDetailsController.dataItem?.area}',
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
                                    "Building No",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${historyDetailsController.dataItem?.building}',
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
                                    "Flat",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${historyDetailsController.dataItem?.flat}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              setHeight(4),
                            ],
                          ),
                        ),
                      ),
                      setHeight(16),
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
