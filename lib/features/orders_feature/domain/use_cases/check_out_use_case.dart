import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/check_out_order_entity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/repository/order_repository.dart';

class CheckOutUseCase {
  final OrderRepository orderRepo;

  const CheckOutUseCase({required this.orderRepo});

  Future<Either<Failure, ChecKOutEntity>> call() {
    return orderRepo.checkOut();
  }
}
