import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mega_ecommerce_app/common_widget/common_text_form_field.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/utiles/app_icons.dart';
import 'package:mega_ecommerce_app/core/utiles/image_picker_bottom_sheet.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/create_product_use_case.dart';
import 'package:mega_ecommerce_app/features/owner_feature/presentation/cubits/create_product/create_product_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  XFile? _image;

  final TextEditingController _name = TextEditingController();

  final TextEditingController _price = TextEditingController();

  final TextEditingController _description = TextEditingController();

  final TextEditingController _countInStock = TextEditingController();

  final TextEditingController _category = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _price.dispose();
    _description.dispose();
    _countInStock.dispose();
    _category.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.addProduct)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: BlocProvider(
                create: (context) => sl<CreateProductCubit>(),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.containerBackground,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            
                            // SizedBox(
                            //   width: double.infinity,
                            //   child: Container(
                            //     padding: EdgeInsets.all(8),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(8),
                            //       color: AppColors.white,
                            //     ),
                            //     child: Row(
                            //       children: [
                            //         CircleAvatar(
                            //           radius: 24,
                            //           backgroundImage: AssetImage(
                            //             AppImages.advertisments,
                            //           ),
                            //         ),
                            //         SizedBox(width: 8),
                            //         Text(AppLocalizations.of(context)!.addMainProductImage),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: () async {
                                final image = await showImagePickerBottomSheet(
                                  context: context,
                                );
                                if (image != null) {
                                  setState(() {
                                    _image = image;
                                  });
                                }
                              },
                              child: SvgPicture.asset(AppIcons.gallery),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppLocalizations.of(context)!.addMainProductImage,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    CommonTextFormFieldWidget(
                      hintText: AppLocalizations.of(context)!.enterProductName,
                      lable: AppLocalizations.of(context)!.name,
                      controller: _name,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty == true) {
                          return AppLocalizations.of(
                            context,
                          )!.pleaseEnterProductName;
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 16),
                    CommonTextFormFieldWidget(
                      hintText: AppLocalizations.of(context)!.enterProductPrice,
                      lable: AppLocalizations.of(context)!.price,
                      controller: _price,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty == true) {
                          return AppLocalizations.of(
                            context,
                          )!.pleaseEnterProductPrice;
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 16),
                    CommonTextFormFieldWidget(
                      hintText:
                          AppLocalizations.of(context)!.enterProductDescription,
                      lable: AppLocalizations.of(context)!.description,
                      controller: _description,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty == true) {
                          return AppLocalizations.of(
                            context,
                          )!.pleaseEnterProductDescription;
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 16),
                    CommonTextFormFieldWidget(
                      hintText:
                          AppLocalizations.of(context)!.productCountInStock,
                      lable: AppLocalizations.of(context)!.countInStock,
                      controller: _countInStock,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty == true) {
                          return AppLocalizations.of(
                            context,
                          )!.pleaseEnterProductCountInStock;
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 16),
                    CommonTextFormFieldWidget(
                      hintText:
                          AppLocalizations.of(context)!.enterProductCategory,
                      lable: AppLocalizations.of(context)!.category,
                      controller: _category,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty == true) {
                          return AppLocalizations.of(
                            context,
                          )!.pleaseEnterProductCategory;
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.containerBackground,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            //     SizedBox(
                            //       width: double.infinity,
                            //       child: ListView.separated(
                            //         physics: NeverScrollableScrollPhysics(),
                            //         shrinkWrap: true,
                            //         separatorBuilder:
                            //             (context, index) => SizedBox(height: 8),
                            //         itemCount: 3,
                            //         itemBuilder: (context, index) {
                            //           return Container(
                            //             padding: EdgeInsets.all(8),
                            //             decoration: BoxDecoration(
                            //               borderRadius: BorderRadius.circular(8),
                            //               color: AppColors.white,
                            //             ),
                            //             child: Row(
                            //               children: [
                            //                 CircleAvatar(
                            //                   radius: 24,
                            //                   backgroundImage: AssetImage(
                            //                     AppImages.advertisments,
                            //                   ),
                            //                 ),
                            //                 SizedBox(width: 8),
                            //                 Text(AppLocalizations.of(context)!.uploadMoreImagesForProduct),
                            //               ],
                            //             ),
                            //           );
                            //         },
                            //       ),
                            //     ),
                            GestureDetector(
                              onTap: () async {
                                final image = await showImagePickerBottomSheet(
                                  context: context,
                                );
                                if (image != null) {
                                  setState(() {
                                    _image = image;
                                  });
                                }
                              },
                              child: SvgPicture.asset(AppIcons.gallery),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppLocalizations.of(
                                context,
                              )!.uploadMoreImagesForProduct,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    BlocConsumer<CreateProductCubit, ICreateProductState>(
                      listener: (context, state) {
                        if (state is CreateProductSuccessState) {
                          showSnackBar(
                            context: context,
                            message:
                                AppLocalizations.of(
                                  context,
                                )!.productCreatedSeccessfully,
                            color: AppColors.green,
                          );
                        } else if (state is CreateProductFailureState) {
                          showSnackBar(
                            context: context,
                            message: state.failure.message,
                            color: AppColors.red,
                          );
                        }
                      },
                      builder: (context, state) {
                        return CommonElevatedButton(
                          isLoading: state is CreateProductLoadingState,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<CreateProductCubit>().createProduct(
                                CreateProductParams(
                                  name: _name.text,
                                  price: double.parse(_price.text),
                                  description: _description.text,
                                  countInStock: int.parse(_countInStock.text),
                                  image: _image!.path,
                                  category: _category.text,
                                ),
                              );
                            }
                          },
                          text: AppLocalizations.of(context)!.addProduct,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
