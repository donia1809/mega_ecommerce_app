enum UserStatusEnum {
  pending('Pending'),
  approved('Approved'),
  rejected('Rejected');

  final String value;

  const UserStatusEnum(this.value);

  factory UserStatusEnum.fromString(String status) {
    return UserStatusEnum.values.firstWhere(
      (element) => element.value.toLowerCase() == status.toLowerCase(),
      orElse: () => UserStatusEnum.pending,
    );
  }
}
