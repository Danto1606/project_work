import 'package:project_work/index.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.height(40),
              ),
              Container(
                height: Dimensions.height(250),
                width: Dimensions.width(200),
                color: Colors.red,
              ),
              ListTile(
                title: Text('title: ${controller.book.title} '),
              ),
              ListTile(
                title: Text('edition: ${controller.book.edition} '),
              ),
              ListTile(
                title: Text('author: ${controller.book.author} '),
              ),
              ListTile(
                title: Text('publiser: ${controller.book.publisher} '),
              ),
              // ListTile(
              //   title: Text('title: ${controller.book.category} '),
              // ),
              ListTile(
                title: Text('ISBN: ${controller.book.isbn} '),
              ),
              ListTile(
                title: Text('pages: ${controller.book.pages} '),
              ),
              ListTile(
                title: Text('Price: ${controller.book.price} '),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
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
                      ? const Text('Buy')
                      : SizedBox(
                          width: Dimensions.width(14.5),
                          height: Dimensions.width(14.5),
                          child: const CircularProgressIndicator(
                            strokeWidth: 1.5,
                            color: ConstColors.primary,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
