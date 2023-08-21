import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_work/app/core/utils/dimensions.dart';
import 'package:project_work/app/data/models/category_model.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimensions.width(5),
          ),
        ),
        color: Get.isDarkMode ? Colors.black : Colors.white,
        child: Container(
          width: Dimensions.width(130),
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width(13),
            vertical: Dimensions.width(5),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Text(
                category.title,
                style: Get.textTheme.labelSmall?.copyWith(
                  fontSize: Dimensions.font(12),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
