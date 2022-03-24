import 'package:assignment/model/city/city_response.dart';
import 'package:assignment/model/weather/wheather_response.dart';
import 'package:assignment/network/api_result.dart';
import 'package:assignment/network/dio_exception.dart';
import 'package:assignment/network/dioclient.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';

class APIRepository {
  late DioClient dioClient;
  late DioClient dioRapidClient;
  final String _apiKey = "509c5d78e444101c0f481c4f243a1523";
  String _baseUrl = "http://api.weatherstack.com/";
  String rapidApiUrl = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/";
  String rapidApiKey = "0842b347c2mshd7518df0cac80aep1a9f4djsn32dffedb4d79";

  APIRepository() {
    var dio = Dio();
    var rapidDio = Dio();

    dioClient = DioClient(_baseUrl, dio);
    dioRapidClient = DioClient(rapidApiUrl, rapidDio);
  }

  Future<ApiResult<Current>> fetchWheather(String city) async {
    try {
      final response = await dioClient.get("current",
          queryParameters: {"access_key": _apiKey, "query": city});
      Current wheather = WheatherResponse.fromJson(response).current;
      return ApiResult.success(wheather);
    } catch (e) {
      return ApiResult.failure(DioExceptions.getDioException(e));
    }
  }

  Future<ApiResult<List<Datas>>> getCities() async {
    try {
      final response = await dioRapidClient.get("TR/regions",
          options: Options(headers: {
            "X-RapidAPI-Host": 'wft-geo-db.p.rapidapi.com',
            'X-RapidAPI-Key':
                '0842b347c2mshd7518df0cac80aep1a9f4djsn32dffedb4d79'
          }));
      List<Datas> city = CityResponse.fromJson(response).data;
      return ApiResult.success(city);
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