import 'package:json_annotation/json_annotation.dart';

part 'city_response.g.dart';

@JsonSerializable( explicitToJson: true)
class CityResponse {

  List<Datas> data;

  CityResponse(this.data);

  factory CityResponse.fromJson(Map<String, dynamic> json) {
    return _$CityResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CityResponseToJson(this);
}


@JsonSerializable(explicitToJson: true)
class Datas {
  String ?countryCode;
  String? fipsCode;  
  String ?isoCode;
  String? name;
  String ?wikiDataId;


  Datas(
      {this.countryCode,
      this.fipsCode,
      this.isoCode,
      this.name,
      this.wikiDataId,
      });



  factory Datas.fromJson(Map<String, dynamic> json) => _$DatasFromJson(json);

  Map<String, dynamic> toJson() => _$DatasToJson(this);
}
