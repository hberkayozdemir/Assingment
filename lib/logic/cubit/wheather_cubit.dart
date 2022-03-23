import 'package:assignment/logic/cubit/result_state.dart';
import 'package:assignment/model/weather/wheather_response.dart';
import 'package:assignment/network/api_repository.dart';
import 'package:assignment/network/api_result.dart';
import 'package:assignment/network/dio_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WheatherCubit extends Cubit<ResultState<Current>> {
  final APIRepository apiRepository;
 

set city(String value){
  city=value;

}
  WheatherCubit({required this.apiRepository}) : super(Idle());


  loadWheatherData(String cityQuery) async {
    emit(ResultState.loading());
    ApiResult<Current> apiResult = await apiRepository.fetchWheather(cityQuery);
    apiResult.when(success: (Current data) {
      emit(ResultState.data(data));
    }, failure: (DioExceptions error) {
      emit(ResultState.error(error));
    });
  }
}