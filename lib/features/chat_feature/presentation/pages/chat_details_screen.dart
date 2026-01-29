import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/chat_feature/presentation/cubits/chat_details/chat_details_cubit.dart';
import 'package:mega_ecommerce_app/features/chat_feature/presentation/cubits/send_message/send_message_cubit.dart';
import 'package:mega_ecommerce_app/features/chat_feature/presentation/widget/build_chat_body_widget.dart';

class ChatDetailsScreen extends StatelessWidget {
  final String userId;

  const ChatDetailsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<ChatDetailsCubit>()..getChatDetails(userId),
        ),
        BlocProvider(create: (context) => sl<SendMessageCubit>()),
      ],
      child: BlocBuilder<ChatDetailsCubit, IChatDetailsState>(
        builder: (context, state) {
          String appBarTitle = "Chat";
          if (state is ChatDetailsSuccessState) {
            appBarTitle = state.chatDetails.otherUser.name;
          }

          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(title: Text(appBarTitle),),
            body:
                state is ChatDetailsLoadingState
                    ? const AppLoadingWidget()
                    : state is ChatDetailsFailureState
                    ? AppFailureWidget(
                      message: state.failure.message,
                      onPressed: () {
                        context.read<ChatDetailsCubit>().getChatDetails(
                          userId,
                        );
                      },
                    )
                    : state is ChatDetailsSuccessState
                    ? Column(
                      children: [
                        Expanded(
                          child: BuildChatBody(
                            chatDetails: state.chatDetails,
                            userId: userId,
                          ),
                        ),
                      ],
                    )
                    : const SizedBox(),
          );
        },
      ),
    );
  }
}
