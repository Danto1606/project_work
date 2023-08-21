import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_work/app/core/constants/const_colors.dart';
import 'package:project_work/app/core/utils/dimensions.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.padding),
          child: GetBuilder<LoginController>(
            builder: (_) {
              return Form(
                key: controller.form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Dimensions.height(100),
                    ),
                    Text(
                      "Welcome",
                      style: Get.textTheme.headlineLarge?.copyWith(
                        fontSize: Dimensions.font(40),
                      ),
                    ),
                    Text(
                      "Back",
                      style: Get.textTheme.headlineMedium?.copyWith(
                        fontSize: Dimensions.font(30),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height(45),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email",
                        helperText: "enter email",
                      ),
                      validator: controller.validEmail,
                      onSaved: controller.saveEmail,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: Dimensions.height(15),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        helperText: "enter password",
                      ),
                      validator: controller.validPassword,
                      onSaved: controller.savePassword,
                      textInputAction: TextInputAction.go,
                      onFieldSubmitted: (a) => controller.save(),
                    ),
                    SizedBox(
                      height: Dimensions.height(25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: controller.signUp,
                          child: Text(
                            "Sign up",
                            style: Get.textTheme.labelSmall?.copyWith(
                              fontSize: Dimensions.font(13),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: controller.save,
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                Dimensions.width(8),
                              ),
                            ),
                            backgroundColor: !controller.isLoading
                                ? ConstColors.primary
                                : Get.theme.scaffoldBackgroundColor,
                            side: BorderSide(
                              color: ConstColors.black,
                              width: 2.5,
                              strokeAlign: !controller.isLoading ? -1 : 1,
                            ),
                            fixedSize: Size(
                              Dimensions.width(35.5),
                              Dimensions.height(25.5),
                            ),
                          ),
                          child: !controller.isLoading
                              ? const Icon(Icons.arrow_forward)
                              : SizedBox(
                                  width: Dimensions.width(14.5),
                                  height: Dimensions.width(14.5),
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 1.5,
                                    color: ConstColors.primary,
                                  ),
                                ),
                        ),
                      ],
                    ),

                    // Center(
                    //   child: Text(
                    //     "forget password",
                    //     style: Get.textTheme.bodySmall?.copyWith(
                    //       fontSize: Dimensions.font(13),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
