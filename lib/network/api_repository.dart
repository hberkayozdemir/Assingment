
import 'package:assignment/model/weather/wheather_response.dart';
import 'package:assignment/network/api_result.dart';
import 'package:assignment/network/dio_exception.dart';
import 'package:assignment/network/dioclient.dart';
import 'package:dio/dio.dart';


class APIRepository {
  late DioClient dioClient;
  final String _apiKey = "509c5d78e444101c0f481c4f243a1523";
  String _baseUrl = "http://api.weatherstack.com/";

  APIRepository() {
    var dio = Dio();

    dioClient = DioClient(_baseUrl, dio);
  }


  Future<ApiResult<Current>> fetchWheather(String city) async{
     try {
       final response = await dioClient.get("current", queryParameters: {"access_key": _apiKey,"query":city});
       Current wheather = WheatherResponse.fromJson(response).current;
       return ApiResult.success(wheather);
     } catch (e) {
       return ApiResult.failure(DioExceptions.getDioException(e));
     }

  }
}
/*
import 'package:dio/dio.dart';
import 'package:wheatherest/weather/model/wheather.dart';

class WheatherRepository {
  Dio? dio;
//http://api.weatherstack.com/current?access_key=509c5d78e444101c0f481c4f243a1523&query=New%20York
  WheatherRepository() {
    dio = Dio();
    dio!.options.baseUrl = "http://api.weatherstack.com/current?access_key=" +
        "509c5d78e444101c0f481c4f243a1523";
  }
  Future<Wheather> getWheaterData(String city) async {
    Response response = await dio!.get("&query=" + city);
    var parsed = response.data;
    return parsed;
  }
}



*/