import 'package:assignment/network/api_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  APIRepository repotest = APIRepository();
  group('Get data from wheather api for paris', () {
    test('Get data success', () async {
      final data = await repotest.fetchWheather("Paris");
      expect(data, isNotNull);
    });
  }
  );

  group('Get data from GeoDb City api rapid api for TR regions', () {
    test('Get data success', () async {
      final data = await repotest.getCities();
      expect(data, isNotNull);
    });
  }
  );



}
