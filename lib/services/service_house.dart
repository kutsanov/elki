import 'package:dio/dio.dart';
import 'package:elki/models/house.dart';
import 'package:elki/providers/api_provider.dart';

class ServiceHouse {
  final _apiProvider = ApiProvider();
  Future<List<House>> list() async {
    Response<dynamic> response =
        await _apiProvider.get(url: "/test/house.json");
    dynamic houses = response.data;
    List<House> listHouses = [];

    if (houses != null) {
      for (var houseMap in houses) {
        House house = House.fromMap(houseMap);
        listHouses.add(house);
      }
    }
    return listHouses;
  }
}
