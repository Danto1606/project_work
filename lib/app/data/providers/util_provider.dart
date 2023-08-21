import 'package:project_work/index.dart';

class UtilProvider extends GetConnect {
  UtilProvider() {
    baseUrl = EndPoints.baseUrl;
  }

  var token = '';
  int? id;

  Map<String, String> headers(token) {
    return {
      'Accept': 'application/json',
      'Content-type': 'application/json; charset=UTF-8',
      'X-Requested-with': 'XMLHttpRequest',
      'Authorization': 'Bearer ${token}',
    };
  }

  Future<Map<String, dynamic>?> addBook(Map<String, dynamic> data) async {
    var res = await post(
      EndPoints.books,
      data,
    );

    if (res.isOk) return res.body;
    print(res.statusText);
  }

  Future<Map<String, dynamic>?> getBook(int id) async {
    var res = await get(
      '${EndPoints.books}?id=id',
    );
    if (res.isOk) return res.body;
    throw Exception(res.body['message']);
  }

  Future<Map<String, dynamic>?> books(int page, [String filter = '']) async {
    var res = await get(
      '${EndPoints.books}?category=$page&filter=$filter',
    );
    if (res.isOk) return res.body;
    throw Exception(res.body['message']);
  }

  Future<Map<String, dynamic>?> categories() async {
    var res = await get(
      EndPoints.categories,
      headers: headers(token),
    );
    if (res.isOk) return res.body;
    return null;
  }

  Future<Map<String, dynamic>?> orders() async {
    var res = await get(
      EndPoints.orders,
    );
    if (res.isOk) return res.body;
    throw Exception(res.body['message']);
  }

  Future<Map<String, dynamic>?> addOrders(List data) async {
    var res = await post(
      EndPoints.orders,
      data,
    );

    if (res.isOk) return res.body;
    throw Exception(res.body['message']);
  }
}
