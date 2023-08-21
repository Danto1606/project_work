import 'package:flutter/foundation.dart';
import 'package:project_work/index.dart';

class SessionService extends GetxService {
  final UserProvider api = Get.find<UserProvider>();
  Future<UserModel?> login(String email, String password) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    var json = await api.login(data);
    var res = json?['data'];
    if (res == null) return null;
    res['image'] = Uint8List.fromList(res['image'].cast<int>().toList());
    res['email'] = email;

    return UserModel.fromMap(res!);
  }

  Future<UserModel?> signup(Map<String, dynamic> data) async {
    var json = await api.signUP(data);

    return UserModel.fromMap(json!);
  }
}
