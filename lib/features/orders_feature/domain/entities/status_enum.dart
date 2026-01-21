enum OrderStatusEnum {
  pending('Pending'),
  processing('Processing'),
  delivered('Delivered'),
  cancelled('Cancelled');

  final String value;

  const OrderStatusEnum(this.value);

  factory OrderStatusEnum.fromString(String status) {
    return OrderStatusEnum.values.firstWhere(
      (element) => element.value.toLowerCase() == status.toLowerCase(),
      orElse: () => OrderStatusEnum.pending,
    );
  }
}
