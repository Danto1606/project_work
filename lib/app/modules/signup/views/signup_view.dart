import 'package:project_work/index.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(builder: (_) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.padding),
            child: Form(
              key: controller.form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.height(60),
                  ),
                  Text(
                    "Welcome",
                    style: Get.textTheme.headlineLarge?.copyWith(
                      fontSize: Dimensions.font(40),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height(10),
                  ),
                  Text(
                    "Create Account",
                    style: Get.textTheme.headlineLarge?.copyWith(
                      fontSize: Dimensions.font(18),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height(25),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Name",
                      helperText: "enter name",
                    ),
                    validator: controller.validName,
                    onSaved: controller.saveName,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: Dimensions.height(15),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Address",
                      helperText: "enter address",
                    ),
                    onSaved: controller.saveAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: Dimensions.height(15),
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
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: Dimensions.height(15),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Confirm password",
                      helperText: "Confirm password",
                    ),
                    validator: controller.confirmPassword,
                    textInputAction: TextInputAction.go,
                    onFieldSubmitted: (a) => controller.save(),
                  ),
                  SizedBox(
                    height: Dimensions.height(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: controller.login,
                        child: Text(
                          "LOGIN",
                          style: Get.textTheme.labelSmall?.copyWith(
                            fontSize: Dimensions.font(14),
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
                        child: const Icon(Icons.person_add_alt_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
