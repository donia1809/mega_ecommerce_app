import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/check_out_order_entity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/my_order_emtity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/order_entity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/use_cases/get_my_orders_use_case.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/use_cases/get_order_details_use_case.dart';

abstract class OrderRepository {
  Future<Either<Failure, ChecKOutEntity>> checkOut();
  Future<Either<Failure, MyOrdersEntity>> getMyOrder(OrdersParams params);
  Future<Either<Failure, OrderEntity>> getOrderDetails(OrdersDetailsParams params);
}
