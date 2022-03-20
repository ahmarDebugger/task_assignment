import 'package:task_assignment/data/model/items.dart';

class ItemResponseModel {
  final List<ItemsModel> items;
  final bool hasError;
  final String error;

  ItemResponseModel(this.items, this.hasError, this.error);

  ItemResponseModel.fromJson(Map<String, dynamic> json)
      : items = (json["itemList"] as List)
      .map((i) => ItemsModel.fromJson(i))
      .toList(),
        hasError = false,
        error = "";
  ItemResponseModel.withError(String errorValue)
      : items = [],
        hasError = true,
        error = errorValue;
}