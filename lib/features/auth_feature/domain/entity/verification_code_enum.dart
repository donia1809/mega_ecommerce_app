enum VerificationCodeEnum {
  forgetPassword('forgetPassword'),
  verifyEmail('forgetEmail'),
  signUp('signUp');

  final String value;

  const VerificationCodeEnum(this.value);

  factory VerificationCodeEnum.fromString(String status) {
    return VerificationCodeEnum.values.firstWhere(
      (element) => element.value.toLowerCase() == status.toLowerCase(),
      orElse: () => VerificationCodeEnum.signUp,
    );
  }
}
