import 'package:json_annotation/json_annotation.dart';

part 'wheather_response.g.dart';

@JsonSerializable( explicitToJson: true)
class WheatherResponse {
  // int page;
  // int totalResults;
  // int totalPages;
  // List<Movie> results;

  // WheatherResponse(this.page, this.totalResults, this.totalPages, this.results);
  Current current;

  WheatherResponse(this.current);

  factory WheatherResponse.fromJson(Map<String, dynamic> json) {
    return _$WheatherResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WheatherResponseToJson(this);
}


@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Current {
  
String? observationTime;
  int? temperature;
  int? weatherCode;
  List<String>? weatherIcons;
  List<String>? weatherDescriptions;
  int? windSpeed;
  int? windDegree;
  String? windDir;
  int? pressure;
  int? precip;
  int? humidity;
  int? cloudcover;
  int? feelslike;
  int? uvIndex;
  int? visibility;
  String? isDay;

  Current(
      {this.observationTime,
      this.temperature,
      this.weatherCode,
      this.weatherIcons,
      this.weatherDescriptions,
      this.windSpeed,
      this.windDegree,
      this.windDir,
      this.pressure,
      this.precip,
      this.humidity,
      this.cloudcover,
      this.feelslike,
      this.uvIndex,
      this.visibility,
      this.isDay});



  factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}
