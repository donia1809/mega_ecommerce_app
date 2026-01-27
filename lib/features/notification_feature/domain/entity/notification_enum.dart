
import '../../../../core/utiles/app_icons.dart';

enum NotificationEnum {
  order('ORDER'),
  product('PRODUCT'),
  announcement('ANNOUNCEMENT'),
  reminder('REMINDER'),
  system('SYSTEM');

  final String value;
  const NotificationEnum(this.value);

  factory NotificationEnum.fromString(String status) {
    return NotificationEnum.values.firstWhere(
      (element) => element.value.toLowerCase() == status.toLowerCase(),
      orElse: () => NotificationEnum.system,
    );
  }

 String get icon {
    switch (this) {
      case NotificationEnum.order:
        return AppIcons.order;

      case NotificationEnum.product:
        return AppIcons.shoppingBag;

      case NotificationEnum.announcement:
        return AppIcons.gift;

      case NotificationEnum.reminder:
        return AppIcons.reminder;

      case NotificationEnum.system:
        return AppIcons.system;
    }
  }
}



