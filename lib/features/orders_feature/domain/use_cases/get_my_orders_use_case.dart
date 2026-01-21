import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/my_order_emtity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/status_enum.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/repository/order_repository.dart';

class GetMyOrdersUseCase {
  final OrderRepository orderRepo;

  GetMyOrdersUseCase({required this.orderRepo});

  Future<Either<Failure, MyOrdersEntity>> call(OrdersParams params) {
    return orderRepo.getMyOrder(params);
  }
}

class OrdersParams {
  final int page;
  final int limit;
  final OrderStatusEnum? status;

  OrdersParams({required this.page,  this.limit = 10,  this.status});

  Map<String, dynamic> get toMap {
    return {'page': page, 'limit': limit,
    if(status != null)
    'status': status?.value,};
  }
}
