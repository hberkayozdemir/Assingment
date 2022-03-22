// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wheather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WheatherResponse _$WheatherResponseFromJson(Map<String, dynamic> json) =>
    WheatherResponse(
      Current.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WheatherResponseToJson(WheatherResponse instance) =>
    <String, dynamic>{
      'current': instance.current.toJson(),
    };

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      observationTime: json['observationTime'] as String?,
      temperature: json['temperature'] as int?,
      weatherCode: json['weatherCode'] as int?,
      weatherIcons: (json['weatherIcons'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      weatherDescriptions: (json['weatherDescriptions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      windSpeed: json['windSpeed'] as int?,
      windDegree: json['windDegree'] as int?,
      windDir: json['windDir'] as String?,
      pressure: json['pressure'] as int?,
      precip: json['precip'] as int?,
      humidity: json['humidity'] as int?,
      cloudcover: json['cloudcover'] as int?,
      feelslike: json['feelslike'] as int?,
      uvIndex: json['uvIndex'] as int?,
      visibility: json['visibility'] as int?,
      isDay: json['isDay'] as String?,
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'observationTime': instance.observationTime,
      'temperature': instance.temperature,
      'weatherCode': instance.weatherCode,
      'weatherIcons': instance.weatherIcons,
      'weatherDescriptions': instance.weatherDescriptions,
      'windSpeed': instance.windSpeed,
      'windDegree': instance.windDegree,
      'windDir': instance.windDir,
      'pressure': instance.pressure,
      'precip': instance.precip,
      'humidity': instance.humidity,
      'cloudcover': instance.cloudcover,
      'feelslike': instance.feelslike,
      'uvIndex': instance.uvIndex,
      'visibility': instance.visibility,
      'isDay': instance.isDay,
    };
