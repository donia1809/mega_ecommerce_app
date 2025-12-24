import 'package:flutter/material.dart' ;
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class OnBoardingScreen extends StatelessWidget
{
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue,
          ),
          Image.asset('assets/images/onBoarging.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
               color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                 [
                  Text(
                    'Look Good, Feel Good',
                    style: AppTextStyles.bold24
                    ),

                  SizedBox(height:context.screenHeight * 0.02 ),

                  Text(
                    textAlign: TextAlign.center,
                    'Create your individual & unique style and look amazing everyday.',
                    style: AppTextStyles.regular15
                  ),

                  SizedBox(height:context.screenHeight * 0.02 ),

                  CommonElevatedButton(
                   onPressed: (){
                     context.navigateTo('/loginScreen');
                   },
                   text: AppLocalizations.of(context)!.getStarted
                  )
                ],
              ),
            ),
          )
          ),
        ],
      ),
    );
  }
}