import 'package:project_work/index.dart';

class Product extends StatelessWidget {
  const Product({
    super.key,
    required this.product,
  });

  final BookModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        margin: EdgeInsets.all(
          Dimensions.width(15),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimensions.width(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Dimensions.width(160),
              width: Dimensions.width(140),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(
                  Dimensions.width(12),
                ),
                // image: DecorationImage(
                //         image: MemoryImage(product.coverImage),
                //         fit: BoxFit.cover,
                //       ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.width(5),
                bottom: Dimensions.width(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Dimensions.width(135),
                    child: Text(
                      'TITLE: ${product.title}',
                      style: Get.textTheme.bodySmall?.copyWith(
                        fontSize: Dimensions.font(14),
                      ),
                    ),
                  ),
                  Text(
                    'AUTHOR: ${product.author}',
                    style: Get.textTheme.bodySmall,
                  ),
                  Text(
                    "PRICE: \$${product.price}",
                    style: Get.textTheme.bodySmall?.copyWith(
                      fontSize: Dimensions.font(14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
