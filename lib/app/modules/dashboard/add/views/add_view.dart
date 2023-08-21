import 'package:project_work/index.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddController>(builder: (_) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.padding,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: controller.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.height(40),
                  ),
                  GestureDetector(
                    onTap: controller.pick,
                    child: Container(
                      height: Dimensions.height(250),
                      width: Dimensions.width(200),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: controller.imagePick(),
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Title",
                      helperText: "enter books title",
                    ),
                    onSaved: controller.saveTitle,
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Edition",
                      helperText: "enter books edition",
                    ),
                    onSaved: controller.saveEdition,
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "ISBN",
                      helperText: "enter books isbn",
                    ),
                    onSaved: controller.saveIsbn,
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Author",
                      helperText: "enter books author",
                    ),
                    onSaved: controller.saveAuthor,
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Publisher",
                      helperText: "enter books Publisher",
                    ),
                    onSaved: controller.savePublisher,
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Pages",
                      helperText: "enter books Pages",
                    ),
                    onSaved: controller.savePages,
                    textInputAction: TextInputAction.next,
                  ),
                  DropdownButtonFormField<int>(
                    decoration: const InputDecoration(
                      labelText: "Category",
                      helperText: "select category",
                    ),
                    onChanged: (value) {},
                    value: controller.category,
                    items: List.generate(
                      Get.put<HomeController>(HomeController())
                          .categories
                          .length,
                      (index) => DropdownMenuItem<int>(
                        value: Get.find<HomeController>().categories[index].id,
                        child: Text(
                          Get.find<HomeController>().categories[index].title,
                        ),
                      ),
                    ),
                  ),
                  DropdownButtonFormField<int>(
                    decoration: const InputDecoration(
                      labelText: "Condition",
                      helperText: "select condition",
                    ),
                    value: controller.condition,
                    onChanged: (value) {},
                    items: List.generate(
                      5,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text([
                          'poor',
                          'old',
                          'fair',
                          ' good',
                          'very good'
                        ][index]),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Price",
                      helperText: "enter books price",
                    ),
                    onSaved: controller.savePrice,
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Comment",
                      helperText: "enter comment on book",
                    ),
                    onSaved: controller.saveComment,
                    maxLines: 10,
                    minLines: 1,
                    maxLength: 250,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: Dimensions.height(20),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: controller.add,
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
                          ? Text(
                              'add',
                              style: Get.textTheme.bodyMedium?.copyWith(
                                color: Colors.white,
                              ),
                            )
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
                  SizedBox(
                    height: Dimensions.height(80),
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
