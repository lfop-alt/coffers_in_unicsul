import 'package:coffers_in/repository/item_repository.dart';
import 'package:dio/dio.dart';

class ItemService extends ItemRepository {
  @override
  Future<List> getItens() async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] =
        "i7ZhMICYLmvYcyuxRRO9ny5iJfjHsXQFjXCboOrX";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "zMYIuyjcW9OUlUlvgq7tblb6e3NRNMlNTaGBFjyz";
    dio.options.headers["Content-Type"] = "application/json";

    var response = await dio.get("https://parseapi.back4app.com/classes/Item");

    // return (response.data["results"] as List)
    //     .map((e) => ItemModel.fromJson(e))
    //     .toList();

    return response.data["results"];
  }
}
