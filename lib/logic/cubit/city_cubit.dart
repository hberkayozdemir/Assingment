import 'package:assignment/logic/cubit/result_state.dart';

import 'package:assignment/network/api_repository.dart';
import 'package:assignment/network/api_result.dart';

import 'package:assignment/network/dio_exception.dart';
import 'package:assignment/model/city/city_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CityCubit extends Cubit<ResultState<List<Datas>>> {
  final APIRepository apiRepository;
 


  CityCubit({required this.apiRepository}) : super(Idle());


  loadCities() async {
    emit(ResultState.loading());
    ApiResult<List<Datas>> apiResult = await apiRepository.getCities();
    apiResult.when(success: (List<Datas> data ) {
      emit(ResultState.data(data));
    }, failure: (DioExceptions error) {
      emit(ResultState.error(error));
    });
  }
}