part of 'privacy_policy_cubit.dart';

sealed class IPrivacyPolicyState extends Equatable {
  const IPrivacyPolicyState();

  @override
  List<Object?> get props => [];
}

final class PrivacyPolicyInitialState extends IPrivacyPolicyState {}

class PrivacyPolicyFailureState extends IPrivacyPolicyState {
  final Failure failure;

  const PrivacyPolicyFailureState({required this.failure});
  @override
  List<Object?> get props => [failure];
}

class PrivacyPolicyLoadingState extends IPrivacyPolicyState {}

class PrivacyPolicySuccessState extends IPrivacyPolicyState {
  final MenuEntity policy;

  const PrivacyPolicySuccessState({required this.policy});
  @override
  List<Object?> get props => [policy];
}
