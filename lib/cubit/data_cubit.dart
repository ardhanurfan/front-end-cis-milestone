import 'package:bloc/bloc.dart';
import 'package:cis/services/connect_api.dart';
import 'package:equatable/equatable.dart';

import '../models/data_model.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());

  void getData(String nik) async {
    try {
      emit(DataLoading());

      DataModel data = await ConnectApi().getData(nik);

      emit(DataSuccess(data));
    } catch (e) {
      emit(DataFailed(e.toString()));
    }
  }
}
