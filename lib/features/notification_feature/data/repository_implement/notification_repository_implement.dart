import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/notification_feature/data/data_source/notification_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/notification_feature/domain/entity/notification_entity.dart';
import 'package:mega_ecommerce_app/features/notification_feature/domain/repository/notification_repository.dart';

class NotificationRepositoryImplement implements NotificationRepository {
  final NotificationRemoteDataSource notificationRemoteDataSource;

  NotificationRepositoryImplement({required this.notificationRemoteDataSource});
  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications() async {
    try {
      final result = await notificationRemoteDataSource.getNotifications();
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }
}
