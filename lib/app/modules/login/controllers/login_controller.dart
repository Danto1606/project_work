import 'package:project_work/index.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> form = GlobalKey();
  late String email;
  late String password;
  final repo = Get.find<SessionService>();
  bool isLoading = false;

  @override
  void onReady() {}

  @override
  void onClose() {}

  //validator
  String? validEmail(String? value) {
    if (!GetUtils.isEmail(value ?? "")) {
      return "enter valid email";
    } else {
      return null;
    }
  }

  String? validPassword(String? value) {
    if (value == null || value.length < 8) {
      return "password should be atleast 8 characters";
    } else {
      return null;
    }
  }

  //onSave methods
  void saveEmail(String? email) => this.email = email ?? "";
  void savePassword(String? password) => this.password = password ?? "";

  //login
  void save() async {
    if (isLoading) return;
    form.currentState?.save();
    if (form.currentState?.validate() == true) {
      isLoading = true;
      update();
      try {
        await repo.login(email, password);
        Get.offAllNamed(Routes.DASHBOARD);
      } on Exception catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }
    isLoading = false;
    update();
  }

  void signUp() {
    if (isLoading) return;
    Get.toNamed(Routes.SIGNUP);
  }
}
