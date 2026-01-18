import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/add_review_use_case.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/cubits/add_review/add_review_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class AddReviewScreen extends StatefulWidget {
  final String productId;

  const AddReviewScreen({super.key, required this.productId});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final TextEditingController _commentController = TextEditingController();
  final double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddReviewCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.reviews),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: BlocConsumer<AddReviewCubit, IAddReviewState>(
          listener: (context, state) {
            if (state is AddReviewFailureState) {
              showSnackBar(
                context: context,
                color: AppColors.red,
                message: state.failure.message,
              );
            } else if (state is AddReviewSuccessState) {
              context.navigateBack(); // close after success
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Write your review...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 16),
                  CommonElevatedButton(
                    isLoading: state is AddReviewLoadingState,
                    text: ('Submit Review'),
                    onPressed: () {
                      context.read<AddReviewCubit>().addReview(
                        AddReviewParams(
                          rating: _rating,
                          comment: _commentController.text,
                        ),
                        widget.productId,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
