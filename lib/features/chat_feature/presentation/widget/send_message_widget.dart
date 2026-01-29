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
                child: UnconstrainedBox //(child: Icon(Icons.send, size: 22)),
                (
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
            height: 200,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: AppColors.iconBackground,
                        child: IconButton(
                          onPressed: () async {
                            final image = await showImagePickerBottomSheet(
                              context: context,
                            );
                            context.navigateBack(image);
                            //Navigator.pop(context, image);
                          },
                          icon: SvgPicture.asset(
                            AppIcons.camera,
                            colorFilter: ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          // Icon(
                          //   Icons.camera_enhance,
                          //   color: AppColors.primaryColor,
                          // ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: AppColors.iconBackground,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            AppIcons.document,
                            colorFilter: ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          // Icon(
                          //   Icons.document_scanner,
                          //   color: AppColors.primaryColor,
                          // ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: AppColors.iconBackground,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            AppIcons.gallery,
                            colorFilter: ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          // Icon(
                          //   Icons.browse_gallery,
                          //   color: AppColors.primaryColor,
                          // ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: AppColors.iconBackground,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            AppIcons.polling,
                            colorFilter: ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          // Icon(
                          //   Icons.poll_outlined,
                          //   color: AppColors.primaryColor,
                          // ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: AppColors.iconBackground,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            AppIcons.location,
                            colorFilter: ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          // Icon(
                          //   Icons.location_history,
                          //   color: AppColors.primaryColor,
                          // ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: AppColors.iconBackground,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            AppIcons.audio,
                            colorFilter: ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          // Icon(
                          //   Icons.audiotrack,
                          //   color: AppColors.primaryColor,
                          // ),
                        ),
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
