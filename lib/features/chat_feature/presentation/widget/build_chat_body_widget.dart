import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/app_images.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/core/utiles/format_time.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/entity/chat_details_entity.dart';
import 'package:mega_ecommerce_app/features/chat_feature/presentation/widget/send_message_widget.dart';

class BuildChatBody extends StatelessWidget {
  final String userId;
  final ChatDetailsEntity chatDetails;

  const BuildChatBody({
    super.key,
    required this.chatDetails,
    required this.userId,
  });

  // @override
  // void dispose() {
  //   _message.dispose();
  //   super.dispose();  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

              itemCount: chatDetails.messages.length,
              itemBuilder: (context, index) {
                final message = chatDetails.messages[index];
                final isCurrentUser =
                    message.sender.id == chatDetails.currentUser.id;

                return Align(
                  alignment:
                      isCurrentUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isCurrentUser
                              ? AppColors.primaryColor
                              : AppColors.containerBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          isCurrentUser
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,

                      children: [
                        ///////////// text message /////////////
                        if (message.text.isNotEmpty)
                          Text(
                            textAlign: TextAlign.start,
                            message.text,
                            style: AppTextStyles.regular15.copyWith(
                              color:
                                  isCurrentUser
                                      ? AppColors.white
                                      : AppColors.black,
                            ),
                          ),

                        ///////////// text & media message /////////////
                        if (message.text.isNotEmpty && message.media.isNotEmpty)
                          SizedBox(height: 8),

                        if (message.media.isNotEmpty)
                          SizedBox(
                            width: 250,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: message.media.length,
                              itemBuilder: (context, index) {
                                final image = message.media[index];
                                return Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: AppImage(path: image),
                                );
                              },
                            ),
                          ),

                        SizedBox(height: 8),
                        Text(
                          formatMessageTime(message.createdAt),
                          style: AppTextStyles.regular13.copyWith(
                            color:
                                isCurrentUser
                                    ? AppColors.white
                                    : AppColors.black,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SendMessageWidget(chatDetails: chatDetails, userId: userId),
        ],
      ),
    );
  }
}
