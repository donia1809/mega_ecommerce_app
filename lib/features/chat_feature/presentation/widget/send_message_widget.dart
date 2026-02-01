import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/core/utiles/app_icons.dart';
import 'package:mega_ecommerce_app/core/utiles/image_picker_bottom_sheet.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/use_cases/send_message_use_case.dart';
import 'package:mega_ecommerce_app/features/chat_feature/presentation/cubits/chat_details/chat_details_cubit.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/chat_details_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/presentation/cubits/send_message/send_message_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class SendMessageWidget extends StatefulWidget {
  final String userId;

  final ChatDetailsEntity chatDetails;

  const SendMessageWidget({
    super.key,
    required this.chatDetails,
    required this.userId,
  });

  @override
  State<SendMessageWidget> createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  final TextEditingController _message = TextEditingController();
  List<XFile> selectedMedia = [];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            autofocus: true,
            controller: _message,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.containerBackground,

              prefixIcon: GestureDetector(
                onTap: () async {
                  final selectedImage = await showBottomSheet(context: context);

                  if (selectedImage != null) {
                    setState(() {
                      selectedMedia.add(selectedImage);
                    });
                    context.read<SendMessageCubit>().sendMessage(
                      SendMessageParams(
                        conversationId: widget.chatDetails.chatId,
                        text: _message.text,
                        media: [selectedImage],
                      ),
                    );
                  }
                },
                child: SvgPicture.asset(AppIcons.link, fit: BoxFit.scaleDown),
              ),

              hintText: AppLocalizations.of(context)!.typeyourMessage,
              hintStyle: AppTextStyles.regular13,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: 48,
          width: 48,
          child: BlocConsumer<SendMessageCubit, ISendMessageState>(
            listener: (context, state) {
              if (state is SendMessageSuccess) {
                _message.clear();
                context.read<ChatDetailsCubit>().sendNewMessage(state.message);
              } else if (state is SendMessageFailure) {
                showSnackBar(
                  context: context,
                  message: state.failure.message,
                  color: AppColors.red,
                );
              }
            },
            builder: (context, state) {
              return CommonElevatedButton(
                color: AppColors.primaryColor,
                isLoading: state is SendMessageLoading,
                onPressed: () {
                  if (_message.text.isNotEmpty || selectedMedia.isNotEmpty) {
                    context.read<SendMessageCubit>().sendMessage(
                      SendMessageParams(
                        conversationId: widget.chatDetails.chatId,
                        text: _message.text,
                        media: selectedMedia.isNotEmpty ? selectedMedia : null,
                      ),
                    );
                    _message.clear();
                    setState(() {
                      selectedMedia.clear();
                    });
                  }
                },
                child: UnconstrainedBox(
                  child: SvgPicture.asset(
                    AppIcons.send,
                    colorFilter: ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<XFile?> showBottomSheet({required BuildContext context}) async {
    return await showModalBottomSheet<XFile>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 250,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _CircleAvatarWidget(
                        onPressed: () async {
                          final image = await showImagePickerBottomSheet(
                            context: context,
                          );
                          context.navigateBack(image);
                        },
                        icon: AppIcons.camera,
                        iconName: AppLocalizations.of(context)!.camera,
                      ),
                      _CircleAvatarWidget(
                        onPressed: () {},
                        icon: AppIcons.document,
                        iconName: AppLocalizations.of(context)!.document,

                      ),
                      _CircleAvatarWidget(
                        onPressed: () {},
                        icon: AppIcons.gallery,
                        iconName: AppLocalizations.of(context)!.galery,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _CircleAvatarWidget(
                        onPressed: () {},
                        icon: AppIcons.polling,
                        iconName: AppLocalizations.of(context)!.polling,
                      ),

                      _CircleAvatarWidget(
                        onPressed: () {},
                        icon: AppIcons.location,
                        iconName: AppLocalizations.of(context)!.location,
                      ),
                      _CircleAvatarWidget(
                        onPressed: () {},
                        icon: AppIcons.audio,
                        iconName: AppLocalizations.of(context)!.audio,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CircleAvatarWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final String iconName;
  const _CircleAvatarWidget({required this.onPressed, required this.icon, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: AppColors.iconBackground,
          child: IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),

        SizedBox(height: 4),

        Text(iconName,style: AppTextStyles.regular13.copyWith(color: AppColors.black),),
      ],
    );
  }
}
