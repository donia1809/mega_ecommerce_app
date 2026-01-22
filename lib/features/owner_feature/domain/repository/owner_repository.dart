import 'package:dartz/dartz.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

abstract class OwnerRepository 
{
  Future<Either<Failure, List<ProductEntity>>> getOwnerProduct();
}
