import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';

part 'increase_value_state.dart';

class IncreaseValueCubit extends Cubit<IIncreaseValueState> {
  IncreaseValueCubit() : super(IncreaseValueInitialState());
}
