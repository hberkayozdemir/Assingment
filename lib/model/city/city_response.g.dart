// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResponse _$CityResponseFromJson(Map<String, dynamic> json) => CityResponse(
      (json['data'] as List<dynamic>)
          .map((e) => Datas.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityResponseToJson(CityResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Datas _$DatasFromJson(Map<String, dynamic> json) => Datas(
      countryCode: json['countryCode'] as String?,
      fipsCode: json['fipsCode'] as String?,
      isoCode: json['isoCode'] as String?,
      name: json['name'] as String?,
      wikiDataId: json['wikiDataId'] as String?,
    );

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'countryCode': instance.countryCode,
      'fipsCode': instance.fipsCode,
      'isoCode': instance.isoCode,
      'name': instance.name,
      'wikiDataId': instance.wikiDataId,
    };
