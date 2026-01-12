import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:mega_ecommerce_app/common_widget/app_images.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';

const List<String> _advertismentsMedia = [
  'https://assets-static.invideo.io/images/large/Creative_Clothing_Advertisement_Ideas_To_Boost_Sales_revised_3_1_cefa9cda88.png',
  'https://tse4.mm.bing.net/th/id/OIP.LlXKTMK_ivlkoo_M52N2NwHaEK?w=1600&h=900&rs=1&pid=ImgDetMain&o=7&rm=3',
  'https://tse1.mm.bing.net/th/id/OIP.XHrsgpbSyrYXhN9lTH2h9AHaFM?rs=1&pid=ImgDetMain&o=7&rm=3',
  'https://th.bing.com/th?id=OIF.ESwnHgTlX7qxGlkX6lbj%2fw&rs=1&pid=ImgDetMain&o=7&rm=3',
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
              return AppImage(
                path: e,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              );
            }).toList(),
      ),
    );
  }
}