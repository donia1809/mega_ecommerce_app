import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/common_widget/app_images.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/utiles/image_picker_bottom_sheet.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/common_widget/name_text_form_field.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/user_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_profile_use_case.dart';
import 'package:mega_ecommerce_app/features/user_featere/presentation/cubits/update_profile/update_profile_cubit.dart';
import 'package:mega_ecommerce_app/features/user_featere/presentation/cubits/user_profile/user_profile_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserProfileCubit>()..getProfile(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.profile)),
        body: BlocBuilder<UserProfileCubit, IUserProfileState>(
          builder: (context, state) {
            if (state is UserProfileFailureState) {
              return AppFailureWidget(
                message: state.failure.message,
                onPressed: () {
                  context.read<UserProfileCubit>().getProfile();
                },
              );
            } else if (state is UserProfileLoadingState) {
              return AppLoadingWidget();
            } else if (state is UserProfileSuccessState) {
              final data = state.profile;
              return _ProfileBody(data: data);
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

class _ProfileBody extends StatefulWidget {
  const _ProfileBody({required this.data});
  final UserProfileEntity data;

  @override
  State<_ProfileBody> createState() => __ProfileBodyState();
}

class __ProfileBodyState extends State<_ProfileBody> {
  final _nameController = TextEditingController();
  XFile? _selectedImage;

  @override
  void initState() {
    _nameController.text = widget.data.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UpdateProfileCubit>(),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: AppImage(
                    path: _selectedImage?.path ?? widget.data.avatar,
                  ),
                ),
                
                Positioned(
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () async {
                      final image = await showImagePickerBottomSheet(
                        context: context,
                      );

                      if (image != null) {
                        setState(() {
                          _selectedImage = image;
                        });
                      }
                    },
                    child: Icon(Icons.camera_alt),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.015),
            NameTextFormField(controller: _nameController),
            SizedBox(height: context.screenHeight * 0.5),

            BlocConsumer<UpdateProfileCubit, IUpdateProfileState>(
              listener: (context, state) {
                if (state is UpdateProfileFailureState) {
                  showSnackBar(
                    context: context,
                    color: AppColors.red,
                    message: state.failure.message,
                  );
                }
                if (state is UpdateProfileSuccessState) {
                  context.navigateBack();
                }
              },
              builder: (context, state) {
                return CommonElevatedButton(
                  isLoading: state is UpdateProfileLoadingState,
                  onPressed: () {
                    context.read<UpdateProfileCubit>().updateProfile(
                      UpdateProfileParams(
                        name: _nameController.text,
                        avatar:
                            _selectedImage != null
                                ? _selectedImage!.path
                                : widget.data.avatar,
                      ),
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.save),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
