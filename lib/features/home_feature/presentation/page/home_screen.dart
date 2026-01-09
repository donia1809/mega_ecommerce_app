import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_ecommerce_app/common_widget/app_images.dart';
import 'package:mega_ecommerce_app/common_widget/cart_details.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/product_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/product_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeScreen extends StatelessWidget {
  //final AuthEntity user;
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(),
              SizedBox(height: 8),
              SlidableWidget(),
              SizedBox(height: 8),
              RowWigdet(
                text: AppLocalizations.of(context)!.newArraivalProducts,
                clicableText: AppLocalizations.of(context)!.viewAll,
                onPress:
                    () => context.navigateTo(
                      AppRoutes.allProductsScreen,
                      // arguments: product,
                    ),
              ),
              SizedBox(height: 8),
              BlocBuilder<ProductsCubit, IProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ProductsFailureState) {
                    showSnackBar(
                      context: context,
                      color: AppColors.red,
                      message: state.failure.message,
                    );
                  }

                  if (state is ProductsSuccessState) {
                    return ProductGridViewWidget(products: state.products);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  //final AuthEntity user ;
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      trailing: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.containerBackground,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: () {
            context.navigateTo('/notificationsScreen');
          },
          child: SvgPicture.asset(
            'assets/icons/notification.svg',
            height: 24,
            width: 24,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      title: Text(
        AppLocalizations.of(context)!.helloUser('donia'),
        style: AppTextStyles.bold28,
      ),
      subtitle: Text(AppLocalizations.of(context)!.welcomeToMega),
    );
  }
}

const List<String> _advertismentsMedia =  [
  'https://assets-static.invideo.io/images/large/Creative_Clothing_Advertisement_Ideas_To_Boost_Sales_revised_3_1_cefa9cda88.png',
'https://tse4.mm.bing.net/th/id/OIP.LlXKTMK_ivlkoo_M52N2NwHaEK?w=1600&h=900&rs=1&pid=ImgDetMain&o=7&rm=3',
'https://tse1.mm.bing.net/th/id/OIP.XHrsgpbSyrYXhN9lTH2h9AHaFM?rs=1&pid=ImgDetMain&o=7&rm=3',
'https://th.bing.com/th?id=OIF.ESwnHgTlX7qxGlkX6lbj%2fw&rs=1&pid=ImgDetMain&o=7&rm=3'
];

class SlidableWidget extends StatelessWidget {
  const SlidableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: ImageSlideshow(
        initialPage: 0,
        indicatorColor: AppColors.primaryColor,
        indicatorBackgroundColor: AppColors.containerBackground,
        indicatorBottomPadding: 8,
        autoPlayInterval: 4000,
        isLoop: true,
        width: double.infinity,
        height: 200,
        children: 
        _advertismentsMedia.map((e) {
          return AppImage(path: e,width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,);
        },).toList()
      ),
    );
  }
}

// class ShowProductWidget extends StatelessWidget {
//   const ShowProductWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           AppLocalizations.of(context)!.newArraivalProducts,
//           textAlign: TextAlign.start,
//           style: AppTextStyles.bold15,
//         ),
//         TextButton(
//           onPressed: () {
//             context.navigateTo(
//               '/allProductsScreen',
//               // arguments: product,
//             );
//           },
//           child: Text(
//             AppLocalizations.of(context)!.viewAll,
//             textAlign: TextAlign.start,
//             style: AppTextStyles.regular13,
//           ),
//         ),
//       ],
//     );
//   }
// }

class ProductGridViewWidget extends StatelessWidget {
  final List<ProductsEntity> products;

  const ProductGridViewWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
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
      ),
    );
  }
}

class RowWigdet extends StatelessWidget {
  final String text;
  final String clicableText;
  final VoidCallback onPress;
  const RowWigdet({
    super.key,
    required this.text,
    required this.clicableText,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, textAlign: TextAlign.start, style: AppTextStyles.bold15),
        TextButton(
          onPressed: onPress,
          child: Text(
            clicableText,
            textAlign: TextAlign.start,
            style: AppTextStyles.regular13.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
