import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/common_widget/common_container_widget.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/features/chat_feature/presentation/cubits/chat/chat_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class AllChatsScreen extends StatelessWidget {
  const AllChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.chats)),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => sl<ChatCubit>()..getAllChats(),
          child: BlocBuilder<ChatCubit, IChatState>(
            builder: (context, state) {
              if (state is ChatLoadingState) {
                return AppLoadingWidget();
              } else if (state is ChatFailureState) {
                return AppFailureWidget(
                  message: state.failure.message,
                  onPressed: () {
                    context.read<ChatCubit>().getAllChats();
                  },
                );
              } else if (state is ChatSuccessState) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    itemCount: state.chat.length,
                    itemBuilder: (context, index) {
                      final chats = state.chat[index];
                      final participant = chats.participants.first;
                      return InkWell(
                        onTap: () {
                          context.navigateTo(
                            AppRoutes.chatDetailsScreen,
                            arguments: chats.participants.last.id,
                          );
                        },
                        child: CommonContainerWidget(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                  participant.avatar,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  participant.name,
                                  style: AppTextStyles.medium15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
