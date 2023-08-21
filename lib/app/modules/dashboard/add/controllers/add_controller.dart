import 'package:flutter/foundation.dart';
import 'package:project_work/index.dart';
import 'package:image_picker/image_picker.dart';

class AddController extends GetxController {
  final repo = Get.find<BookService>();
  GlobalKey<FormState> key = GlobalKey();
  final ImagePicker picker = ImagePicker();

  bool isLoading = false;
  String? title;
  String? isbn;
  String? author;
  String? edition;
  String? publisher;
  String? comment;
  int? pages;
  int condition = 3;
  int? category = 1;
  double? price;
  Uint8List? image;

  void saveTitle(String? value) => title = value;
  void saveIsbn(String? value) => isbn = value;
  void saveAuthor(String? value) => author = value;
  void saveEdition(String? value) => edition = value;
  void savePublisher(String? value) => publisher = value;
  void saveComment(String? value) => comment = value;
  void savePages(String? value) => pages = int.tryParse(value ?? '');
  void savePrice(String? value) => price = double.tryParse(value ?? '');

  void add() async {
    if (isLoading) return;
    key.currentState?.save();
    if (key.currentState?.validate() == true) {
      var data = {
        'image': image,
        'title': title,
        'isbn': isbn,
        'author': author,
        'edition': edition,
        'publisher': publisher,
        'comment': comment,
        'pages': pages,
        'condition': condition,
        'category': category,
        'price': price,
        'user_id': Get.find<UtilProvider>().id,
      };
      isLoading = true;
      update();
      try {
        await repo.add(data);
      } on Exception catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }
    isLoading = false;
    update();
  }

  imagePick() => image == null
      ? AssetImage('assets/placeholder.jpg')
      : MemoryImage(image!);

  void pick() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    image = await photo?.readAsBytes();
    update();
  }
}
