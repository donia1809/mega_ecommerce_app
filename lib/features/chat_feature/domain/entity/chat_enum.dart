
enum ChatEnum {
  sent('sent'),
  delivered('delivered'),
  seen('seen');

  final String value;

  const ChatEnum(this.value);

  factory ChatEnum.fromString(String status) {
    return ChatEnum.values.firstWhere(
      (element) => element.value.toLowerCase()==status.toLowerCase(),
      orElse: () => ChatEnum.sent,
    );
  }
}
