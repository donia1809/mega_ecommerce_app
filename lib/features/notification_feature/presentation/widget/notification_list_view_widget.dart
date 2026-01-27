import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_ecommerce_app/common_widget/common_container_widget.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/features/notification_feature/domain/entity/notification_entity.dart';
import 'package:mega_ecommerce_app/features/notification_feature/notification_router.dart';

class NotificationListViewWidget extends StatelessWidget {
  final List<NotificationEntity> notifications;
  const NotificationListViewWidget({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 8),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return InkWell(
          onTap: () {
            NotificationRouter.handle(
              context: context,
              data: notification.clickableItemId,
              type: notification.type,
            );
          },
          child: CommonContainerWidget(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.containerBackground,
                  ),
                  child: SvgPicture.asset(
                    notification.type.icon,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.title, style: AppTextStyles.medium15),
                      Text(
                        notification.message,
                        style: AppTextStyles.regular15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
