import 'package:dio/dio.dart';
import 'package:task_assignment/data/model/item_response_model.dart';
import 'package:task_assignment/data/model/items.dart';

class ApiClient {
  static String apiUrl = "http://3.128.210.224:3003/api/v2/grocery/getSellingItems";
  final Dio _dio = Dio();
  Future<ItemsModel> getItems(index)async {
    var params = {"bundleIndex": index, };
    try {
      Response response = await _dio.post(apiUrl, queryParameters: params);
      print("Response Result ${response.data}");
      return ItemsModel.fromJson(response.data);
    } catch (error, stacktrace) {
      ItemsModel myList=ItemsModel(success: false, message: "ERROR", itemList: []);
      return myList;
    }
  }
}