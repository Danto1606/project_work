import 'package:project_work/index.dart';

class HomeController extends GetxController {
  final repo = Get.find<BookService>();
  RxList<BookModel> books = <BookModel>[].obs;
  List<CategoryModel> categories = [];

  @override
  void onReady() async {
    // while (categories.isEmpty) {
    categories = await repo.categories();
    // }
    update();
    super.onReady();
  }

  void getBooks(int category) async {
    books.clear();
    try {
      books.value = await repo.get(category);
    } catch (_) {
      Get.snackbar('Error', 'something went wrong');
    }
  }

  void getCategoriess() async {
    if (categories.isNotEmpty) return;
    try {
      categories = await repo.categories();
      update();
    } catch (_) {
      Get.snackbar('Error', 'something went wrong');
    }
  }
}
