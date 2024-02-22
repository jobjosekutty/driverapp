import 'package:driverapp/constants/app_constant.dart';
import 'package:driverapp/constants/app_theme.dart';
import 'package:driverapp/controllers/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  LoginController loginController = Get.put(LoginController());

  final formKey = GlobalKey<FormState>();

  final usernameFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "login",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    TextFormField(
                      focusNode: usernameFocusNode,
                      controller: usernameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter Username';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        floatingLabelStyle: GoogleFonts.poppins(
                          color: AppColors.blue1,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8.0,
                        ),
                        label: const Text(
                          'username',
                        ),
                        hintText: 'username',
                        labelStyle: appTextStyle(),
                        hintStyle: appTextStyle(),
                        border: OutlineInputBorder(
                          borderRadius: textFieldBorderRadius,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: textFieldBorderRadius,
                          borderSide: BorderSide(
                            width: 0.5,
                            color: AppColors.blue1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: textFieldBorderRadius,
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    setHeight(16),
                    TextFormField(
                      focusNode: passwordFocusNode,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter Password';
                        }

                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      decoration: InputDecoration(
                        floatingLabelStyle: GoogleFonts.poppins(
                          color: AppColors.blue1,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8.0,
                        ),
                        label: const Text(
                          'password',
                        ),
                        hintText: 'password',
                        labelStyle: appTextStyle(),
                        hintStyle: appTextStyle(),
                        border: OutlineInputBorder(
                          borderRadius: textFieldBorderRadius,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: textFieldBorderRadius,
                          borderSide: BorderSide(
                            width: 0.5,
                            color: AppColors.blue1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: textFieldBorderRadius,
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    setHeight(16),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'By clicking the login button below,you acknowledge that you have read and agree to our ',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: AppColors.grey3,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: AppColors.grey3,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    setHeight(16),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GetBuilder<LoginController>(
                          builder: (controller) {
                            return loginController.loading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : CupertinoButton(
                                    onPressed: () {
                                      // if (formKey.currentState!.validate()) {
                                      // login(usernameController.text,
                                      //     passwordController.text);
                                      // setState(() {});
                                      loginController.login(
                                          usernameController.text,
                                          passwordController.text);
                                      //   }
                                    },
                                    color: AppColors.blue1,
                                    child: Text(
                                      'login',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ],
                    ),
                    setHeight(8),
                    Image.asset(
                      "assets/logo.jpeg",
                      height: 175,
                      width: 175,
                    )
                    // CupertinoButton(
                    //   child: Text(
                    //     'Login with phone',
                    //     style: GoogleFonts.poppins(
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: 14,
                    //       color: AppColors.primarycolor,
                    //     ),
                    //   ),
                    //   onPressed: () {},
                    // ),
                    // RichText(
                    //   text: TextSpan(
                    //     children: [
                    //       TextSpan(
                    //         text: 'Dont have Account',
                    //         style: GoogleFonts.poppins(
                    //           fontWeight: FontWeight.w400,
                    //           fontSize: 14,
                    //           color: AppColors.grey1,
                    //         ),
                    //       ),
                    //       const WidgetSpan(
                    //         alignment: PlaceholderAlignment.baseline,
                    //         baseline: TextBaseline.alphabetic,
                    //         child: SizedBox(width: 10),
                    //       ),
                    //       TextSpan(
                    //         text: 'Register here',
                    //         style: GoogleFonts.poppins(
                    //           fontWeight: FontWeight.w600,
                    //           fontSize: 14,
                    //           color: AppColors.primarycolor,
                    //         ),
                    //         recognizer: TapGestureRecognizer()..onTap = () {},
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
