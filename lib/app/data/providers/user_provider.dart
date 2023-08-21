import 'dart:typed_data';

import 'package:project_work/index.dart';

class UserProvider extends GetConnect {
  UserProvider() {
    baseUrl = EndPoints.baseUrl;
  }

  String? token;

  Map<String, String> headers() {
    return {
      'Accept': 'application/json',
      'Content-type': 'application/json; charset=UTF-8',
      'X-Requested-with': 'XMLHttpRequest',
      'authorization': 'bearer $token',
    };
  }

  Future<Map<String, dynamic>?> login(Map data) async {
    var res = await post(
      EndPoints.login,
      data,
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json; charset=UTF-8',
        'X-Requested-with': 'XMLHttpRequest',
      },
    );
    Get.find<UtilProvider>().token = token = res.body['token'];
    Get.find<UtilProvider>().id = res.body['data']['id'];
    if (res.isOk) return res.body;
    throw Exception(res.body['message']);
  }

  Future<Map<String, dynamic>?> signUP(Map<String, dynamic> data) async {
    var res = await post(
      EndPoints.user,
      data,
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*"
      },
    );
    if (res.isOk) {
      token = res.body['token'];
      Get.find<UtilProvider>().token = token = res.body['token'];
      data['image'] =
          Uint8List.fromList(res.body['data']['image'].cast<int>().toList());
      data['id'] = res.body['data']['id'];
      Get.find<UtilProvider>().id = data['id'];

      return data;
    }
    throw Exception(res.statusText);
  }

  Future<Map<String, dynamic>?> user(int id) async {
    var res = await get(
      '${EndPoints.users}?id=id',
      headers: headers(),
    );
    if (res.isOk) return res.body;
    throw Exception(res.body['message']);
  }

  Future<Map<String, dynamic>?> users(int page) async {
    var res = await get(
      '${EndPoints.users}?page=$page',
      headers: headers(),
    );
    if (res.isOk) return res.body;
    throw Exception(res.body['message']);
  }
}
