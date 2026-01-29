import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Mega Ecommerce App'**
  String get appTitle;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get login;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @updateEmail.
  ///
  /// In en, this message translates to:
  /// **'Update Email'**
  String get updateEmail;

  /// No description provided for @newEmail.
  ///
  /// In en, this message translates to:
  /// **'New Email'**
  String get newEmail;

  /// No description provided for @enterNewEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter New Email'**
  String get enterNewEmail;

  /// No description provided for @pleaseEnterYourNewEmail.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your New Email'**
  String get pleaseEnterYourNewEmail;

  /// No description provided for @pleaseEnterEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Email Address'**
  String get pleaseEnterEmailAddress;

  /// No description provided for @pleaseEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Password'**
  String get pleaseEnterPassword;

  /// No description provided for @pleaseEnterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get pleaseEnterValidEmail;

  /// No description provided for @passwordMustBeAtLeast6Characters.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMustBeAtLeast6Characters;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @enterYourEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Email Address'**
  String get enterYourEmailAddress;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @pleaseEnterYourNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your New Password'**
  String get pleaseEnterYourNewPassword;

  /// No description provided for @nterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Yoyr Password'**
  String get nterYourPassword;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forgetPassword;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already Have Account'**
  String get alreadyHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @oTPIsRequired.
  ///
  /// In en, this message translates to:
  /// **'OTP is required'**
  String get oTPIsRequired;

  /// No description provided for @enterCompleteOTP.
  ///
  /// In en, this message translates to:
  /// **'Enter complete OTP'**
  String get enterCompleteOTP;

  /// No description provided for @pleaseEnterConfirmationPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter Confirmation Password'**
  String get pleaseEnterConfirmationPassword;

  /// No description provided for @passwordDoesNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Password Does not match'**
  String get passwordDoesNotMatch;

  /// No description provided for @exploreAppToGetAlittleKnowAboutFeaturesWithOutCredationals.
  ///
  /// In en, this message translates to:
  /// **'Explore app to get a little know about features with out credationals'**
  String get exploreAppToGetAlittleKnowAboutFeaturesWithOutCredationals;

  /// No description provided for @continueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue As Guest'**
  String get continueAsGuest;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Name'**
  String get enterYourName;

  /// No description provided for @pleaseEnterValidName.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid Name'**
  String get pleaseEnterValidName;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @enterConfirmationPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirmtion Password'**
  String get enterConfirmationPassword;

  /// No description provided for @verificationCode.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verificationCode;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @youCanResendConfirmationCodeAfter.
  ///
  /// In en, this message translates to:
  /// **'you can resend confirmation code after'**
  String get youCanResendConfirmationCodeAfter;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// Greeting message with user name
  ///
  /// In en, this message translates to:
  /// **'Hello {name}'**
  String helloUser(String name);

  /// No description provided for @welcomeToMega.
  ///
  /// In en, this message translates to:
  /// **'Welcome To Mega'**
  String get welcomeToMega;

  /// No description provided for @newArraivalProducts.
  ///
  /// In en, this message translates to:
  /// **'New Arraival Products'**
  String get newArraivalProducts;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @allProduct.
  ///
  /// In en, this message translates to:
  /// **'All Product'**
  String get allProduct;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @addReviow.
  ///
  /// In en, this message translates to:
  /// **'Add Review'**
  String get addReviow;

  /// No description provided for @howWasYourExperience.
  ///
  /// In en, this message translates to:
  /// **'How Was Your Experience'**
  String get howWasYourExperience;

  /// No description provided for @descripeYourExperience.
  ///
  /// In en, this message translates to:
  /// **'Descripe Your Experience'**
  String get descripeYourExperience;

  /// No description provided for @submitReview.
  ///
  /// In en, this message translates to:
  /// **'Submit Review'**
  String get submitReview;

  /// No description provided for @notificatios.
  ///
  /// In en, this message translates to:
  /// **'Notificatios'**
  String get notificatios;

  /// No description provided for @totalPrice.
  ///
  /// In en, this message translates to:
  /// **'Total Price'**
  String get totalPrice;

  /// No description provided for @checkOut.
  ///
  /// In en, this message translates to:
  /// **'Check Out'**
  String get checkOut;

  /// No description provided for @orderConfirmed.
  ///
  /// In en, this message translates to:
  /// **'OrderC onfirmed'**
  String get orderConfirmed;

  /// No description provided for @yourOrderHasBeenConfirmedWeWillSendYouConfirmationEmailShortly.
  ///
  /// In en, this message translates to:
  /// **'Your order has been confirmed, we will send you confirmation email shortly.'**
  String get yourOrderHasBeenConfirmedWeWillSendYouConfirmationEmailShortly;

  /// No description provided for @goToOrders.
  ///
  /// In en, this message translates to:
  /// **'Go To Orders'**
  String get goToOrders;

  /// No description provided for @continueShopping.
  ///
  /// In en, this message translates to:
  /// **'Continue Shopping'**
  String get continueShopping;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get userName;

  /// No description provided for @accountInformation.
  ///
  /// In en, this message translates to:
  /// **'Account Information'**
  String get accountInformation;

  /// No description provided for @updatePassword.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get updatePassword;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsAndConditions;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get aboutApp;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @rateTheApp.
  ///
  /// In en, this message translates to:
  /// **'Rate the App'**
  String get rateTheApp;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @updatelangauge.
  ///
  /// In en, this message translates to:
  /// **'Update langauge'**
  String get updatelangauge;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @favourite.
  ///
  /// In en, this message translates to:
  /// **'favourite'**
  String get favourite;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @producDetails.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get producDetails;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @lookGoodFeelGood.
  ///
  /// In en, this message translates to:
  /// **'Look Good, Feel Good'**
  String get lookGoodFeelGood;

  /// No description provided for @createUniqueStyle.
  ///
  /// In en, this message translates to:
  /// **'Create your individual & unique style and look amazing everyday.'**
  String get createUniqueStyle;

  /// No description provided for @pleaseEnterValidPassword.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid Password'**
  String get pleaseEnterValidPassword;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add To Cart'**
  String get addToCart;

  /// No description provided for @addedToCartSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Added To Cart Successfully'**
  String get addedToCartSuccessfully;

  /// No description provided for @productRemovedFromCartSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Product removed from cart successfully'**
  String get productRemovedFromCartSuccessfully;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// No description provided for @orderNum.
  ///
  /// In en, this message translates to:
  /// **'Order Num: '**
  String get orderNum;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status: '**
  String get status;

  /// No description provided for @count.
  ///
  /// In en, this message translates to:
  /// **'Count: '**
  String get count;

  /// No description provided for @storeOwner.
  ///
  /// In en, this message translates to:
  /// **'Store Owner: '**
  String get storeOwner;

  /// No description provided for @product.
  ///
  /// In en, this message translates to:
  /// **'Products: '**
  String get product;

  /// No description provided for @becomeStoreOwner.
  ///
  /// In en, this message translates to:
  /// **'Become Store Owner'**
  String get becomeStoreOwner;

  /// No description provided for @requestBeStoreOwner.
  ///
  /// In en, this message translates to:
  /// **'Request To Be Store Owner'**
  String get requestBeStoreOwner;

  /// No description provided for @welcomeRequestMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome in mega store business,\n be part of our team and be one of our family'**
  String get welcomeRequestMessage;

  /// No description provided for @business.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get business;

  /// No description provided for @describeYourBusiness.
  ///
  /// In en, this message translates to:
  /// **'Describe for admin your business'**
  String get describeYourBusiness;

  /// No description provided for @sendRequest.
  ///
  /// In en, this message translates to:
  /// **'Send Request'**
  String get sendRequest;

  /// No description provided for @pleaseEnterYourBusinessDescribtion.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your Business Describtion'**
  String get pleaseEnterYourBusinessDescribtion;

  /// No description provided for @manageMyStore.
  ///
  /// In en, this message translates to:
  /// **'Manage My Store'**
  String get manageMyStore;

  /// No description provided for @storePtoducts.
  ///
  /// In en, this message translates to:
  /// **'Store Ptoducts'**
  String get storePtoducts;

  /// edit localization -------------------
  ///
  /// In en, this message translates to:
  /// **'Edit Product'**
  String get editProduct;

  /// No description provided for @removeProduct.
  ///
  /// In en, this message translates to:
  /// **'Remove Product'**
  String get removeProduct;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @enterProductName.
  ///
  /// In en, this message translates to:
  /// **'Enter product name'**
  String get enterProductName;

  /// No description provided for @enterProductPrice.
  ///
  /// In en, this message translates to:
  /// **'Enter product price'**
  String get enterProductPrice;

  /// No description provided for @enterProductDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter product description'**
  String get enterProductDescription;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @countInStock.
  ///
  /// In en, this message translates to:
  /// **'Count in stock'**
  String get countInStock;

  /// No description provided for @productCountInStock.
  ///
  /// In en, this message translates to:
  /// **'Enter product count in stock number'**
  String get productCountInStock;

  /// No description provided for @enterProductCategory.
  ///
  /// In en, this message translates to:
  /// **'Enter product category'**
  String get enterProductCategory;

  /// No description provided for @addProduct.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get addProduct;

  /// No description provided for @pleaseEnterProductName.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Product Name'**
  String get pleaseEnterProductName;

  /// No description provided for @pleaseEnterProductPrice.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Product Price'**
  String get pleaseEnterProductPrice;

  /// No description provided for @pleaseEnterProductDescription.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Product Description'**
  String get pleaseEnterProductDescription;

  /// No description provided for @pleaseEnterProductCountInStock.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Product Count In Stock'**
  String get pleaseEnterProductCountInStock;

  /// No description provided for @pleaseEnterProductCategory.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Product Category'**
  String get pleaseEnterProductCategory;

  /// No description provided for @addMainProductImage.
  ///
  /// In en, this message translates to:
  /// **'Add main product image'**
  String get addMainProductImage;

  /// No description provided for @uploadMoreImagesForProduct.
  ///
  /// In en, this message translates to:
  /// **'Upload more images for product'**
  String get uploadMoreImagesForProduct;

  /// No description provided for @productCreatedSeccessfully.
  ///
  /// In en, this message translates to:
  /// **'Product Created Seccessfully'**
  String get productCreatedSeccessfully;

  /// No description provided for @productDeletedSuccessfuly.
  ///
  /// In en, this message translates to:
  /// **'Product Deleted Successfuly'**
  String get productDeletedSuccessfuly;

  /// No description provided for @silenceIsGolden.
  ///
  /// In en, this message translates to:
  /// **'Silence is golden, but deals are better'**
  String get silenceIsGolden;

  /// No description provided for @weWellLetYou.
  ///
  /// In en, this message translates to:
  /// **'We\'ll let you know when something exciting happens.'**
  String get weWellLetYou;

  /// No description provided for @exploreProducts.
  ///
  /// In en, this message translates to:
  /// **'Explore Products'**
  String get exploreProducts;

  /// No description provided for @chatWithUs.
  ///
  /// In en, this message translates to:
  /// **'Chat With Us'**
  String get chatWithUs;

  /// No description provided for @chats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chats;

  /// No description provided for @typeyourMessage.
  ///
  /// In en, this message translates to:
  /// **'Type Your message...'**
  String get typeyourMessage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
