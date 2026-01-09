import 'package:equatable/equatable.dart';

class CachedUserEntity extends Equatable
 {
  final String name;
  final String id;
  final String email;
  final bool isVerified;


  const CachedUserEntity({ required this.isVerified, required this.name, required this.id, required this.email});
  

  @override
  List<Object?> get props => [name, id, email,isVerified];

}
