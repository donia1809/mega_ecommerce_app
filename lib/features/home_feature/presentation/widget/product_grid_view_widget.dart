import 'package:flutter/widgets.dart';
import 'package:mega_ecommerce_app/common_widget/product_details.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProductGridViewWidget extends StatelessWidget {
  final List<ProductsEntity> products;

  const ProductGridViewWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            ResponsiveValue<int>(
              context,
              conditionalValues: [
                //if tablete return value = 3 هيروح يشوف في ال breake points هو فعلا بين ال 451 و 800 ولا لا
                // land scape دي عشان لو عملت rotate للشاشة
                Condition.equals(name: TABLET, value: 3, landscapeValue: 3),
                //لو عدي ال 800 هيعمل set value = 4 حاطين ال breake point عشان لو مش عايز اديله name
                Condition.largerThan(
                  name: TABLET,
                  value: 4,
                  landscapeValue: 4,
                  breakpoint: 800,
                ),
                //بحط انا ال breake points بايدي. من 200 ل 600 مثلا رجعلي value
                //Condition.between(start: 200, end: 600 , value: 3)
              ],
              defaultValue: 2, //دي عشان لو هو مش اي حاجة من الي فوق دول
            ).value,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        childAspectRatio: 0.58,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];

        return ProductCard(
          product: product,
          onTap: () {
            context.navigateTo(
              AppRoutes.productDetailsScreen,
              arguments: product.id,
            );
          },
        );
      },
    );
  }
}
