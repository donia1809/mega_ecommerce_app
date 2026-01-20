import 'package:equatable/equatable.dart';

class OwnerEntity extends Equatable {
  final String id;
  final String name;
  final String image;
  final int rate;

  const OwnerEntity({required this.id, required this.name, required this.image, required this.rate});
  
  @override
  List<Object?> get props => [id,name,image,rate];
}
