import 'package:equatable/equatable.dart';

class ToggleFavoriteEntity extends Equatable 
{
  final String message;

  const ToggleFavoriteEntity({
    required this.message,
  });
  
  @override
  List<Object?> get props => [message];
}
