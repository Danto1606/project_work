import 'package:project_work/index.dart';

class BookService extends GetxService {
  final UtilProvider util = Get.find<UtilProvider>();

  Future<BookModel?> add(Map<String, dynamic> data) async {
    try {
      var json = await util.addBook(data);
      if (json == null) return null;
      return BookModel.fromMap(json['data'] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CategoryModel>> categories() async {
    var json = await util.categories();

    List<CategoryModel> list = [];
    try {
      for (Map<String, dynamic> map in json?['data']) {
        list.add(CategoryModel.fromMap(map));
      }
    } catch (e) {
      //
    }
    return list;
  }

  Future<List<BookModel>> get(int page) async {
    var json = await util.books(page);

    List<BookModel> list = [];
    try {
      for (Map<String, dynamic> map in json?['data']) {
        list.add(BookModel.fromMap(map));
      }
    } catch (e) {
      throw Exception('something went wrong');
    }
    return list;
  }
}
