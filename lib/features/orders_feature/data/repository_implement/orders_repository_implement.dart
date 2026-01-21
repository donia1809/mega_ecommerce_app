import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/exeptions/exceptions_handler.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/orders_feature/data/data_source/order_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/check_out_order_entity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/my_order_emtity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/order_entity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/repository/order_repository.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/use_cases/get_my_orders_use_case.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/use_cases/get_order_details_use_case.dart';

class OrdersRepositoryImplement implements OrderRepository
{
  final OrderRemoteDataSource orderRemoteDataSource;

  OrdersRepositoryImplement({required this.orderRemoteDataSource});
  @override
  Future<Either<Failure, ChecKOutEntity>> checkOut() async {
    try {
      final result = await orderRemoteDataSource.checkOut();
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, MyOrdersEntity>> getMyOrder(OrdersParams params) async {
    try {
      final result = await orderRemoteDataSource.getMyOrder(params);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> getOrderDetails(OrdersDetailsParams params) async {
    try {
      final result = await orderRemoteDataSource.getOrderDetails(params);
      return Right(result);
    } catch (e) {
      return Left(ExceptionsHandler(object: e).toFailure);
    }
  }}