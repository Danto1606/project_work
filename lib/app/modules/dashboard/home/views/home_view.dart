import 'package:flutter/foundation.dart' show Uint8List;
import 'package:project_work/index.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            Dimensions.height(200),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: Dimensions.width(40),
              left: Dimensions.width(10),
              right: Dimensions.width(10),
              bottom: Dimensions.width(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Dimensions.width(300),
                  child: SearchAnchor.bar(
                    suggestionsBuilder: (context, controller) => [],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: controller.categories.isEmpty
            ? const Center(
                child: Text('Loading'),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.height(80),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categories.length,
                          itemBuilder: (context, index) => Category(
                            category: CategoryModel(
                                id: controller.categories[index].id,
                                title: '${controller.categories[index].title}'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height(20),
                      ),
                      Wrap(
                        children: List.generate(
                          4,
                          (index) => Product(
                            product: BookModel(
                              id: index,
                              title: 'Material and Metallogical engineering',
                              edition: 'edition',
                              ownerId: index,
                              author: 'hamani',
                              price: 120.4,
                              publisher: 'printer',
                              isbn: '1129-89889-771652',
                              category: 1,
                              pages: 200,
                              condition: 3,
                              images: Uint8List.fromList(
                                [
                                  89,
                                  22,
                                  445,
                                  55,
                                  55,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
