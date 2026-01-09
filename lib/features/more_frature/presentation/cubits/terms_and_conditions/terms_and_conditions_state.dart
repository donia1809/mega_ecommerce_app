part of 'terms_and_conditions_cubit.dart';

sealed class ITermsAndConditionsState extends Equatable {
  const ITermsAndConditionsState();

  @override
  List<Object?> get props => [];
}

final class TermsAndConditionsInitialState extends ITermsAndConditionsState {}

class TermsAndConditionsFailureState extends ITermsAndConditionsState {
  final Failure failure;

  const TermsAndConditionsFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}

class TermsAndConditionsLoadingState extends ITermsAndConditionsState {}

class TermsAndConditionsSuccessState extends ITermsAndConditionsState {
  final MenuEntity terms;

  const TermsAndConditionsSuccessState({required this.terms});
  @override
  List<Object?> get props => [terms];
}
