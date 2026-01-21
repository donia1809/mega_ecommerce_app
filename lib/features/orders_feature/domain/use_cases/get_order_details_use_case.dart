import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/order_entity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/repository/order_repository.dart';

class OrdersDetailsParams {
  final String id;

  OrdersDetailsParams({required this.id});
  Map<String, dynamic> get toMap {
    return {'id': id};
  }
}

class GetOrderDetailsUseCase {
  final OrderRepository orderRepo;

  GetOrderDetailsUseCase({required this.orderRepo});
  Future<Either<Failure, OrderEntity>> call(OrdersDetailsParams params) {
    return orderRepo.getOrderDetails(params);
  }
}
