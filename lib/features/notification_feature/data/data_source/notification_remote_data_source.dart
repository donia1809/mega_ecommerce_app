import 'package:mega_ecommerce_app/core/network/api_helper.dart';
import 'package:mega_ecommerce_app/features/notification_feature/data/model/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
}

class NotificationRemoteDataSourceImplement
    implements NotificationRemoteDataSource {
  final ApiHelper apiHelper;

  const NotificationRemoteDataSourceImplement({required this.apiHelper});

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final response = await apiHelper.getRequest(
      endPoint: '/api/orders/notifications',
    );
    final List dataJson = response as List;

  final List<NotificationModel> notifications =
      dataJson.map((e) => NotificationModel.fromJson(e)).toList();

  return notifications;
  }
}
