// To parse this JSON data, do
//
//     final itemsModel = itemsModelFromJson(jsonString);

import 'dart:convert';

ItemsModel itemsModelFromJson(String str) => ItemsModel.fromJson(json.decode(str));

String itemsModelToJson(ItemsModel data) => json.encode(data.toJson());

class ItemsModel {
  ItemsModel({
   required this.success,
   required this.message,
   required this.itemList,
  });

  bool success;
  String message;
  List<ItemList> itemList;

  factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
    success: json["success"],
    message: json["message"],
    itemList: List<ItemList>.from(json["itemList"].map((x) => ItemList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "itemList": List<dynamic>.from(itemList.map((x) => x.toJson())),
  };
}

class ItemList {
  ItemList({
   required this.id,
   required this.bundleDeactivatedOn,
   required this.bundleActivatedOn,
   required this.bundleActiveStatus,
   required this.bundleIndex,
    required this.bundlePrice,
    required this.bundleTag,
    required this.item,
    required this.v,
  });

  String id;
  DateTime bundleDeactivatedOn;
  DateTime bundleActivatedOn;
  bool bundleActiveStatus;
  int bundleIndex;
  int bundlePrice;
  String bundleTag;
  List<Item> item;
  int v;

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
    id: json["_id"],
    bundleDeactivatedOn: DateTime.parse(json["bundleDeactivatedOn"]),
    bundleActivatedOn: DateTime.parse(json["bundleActivatedOn"]),
    bundleActiveStatus: json["bundleActiveStatus"],
    bundleIndex: json["bundleIndex"],
    bundlePrice: json["bundlePrice"],
    bundleTag: json["bundleTag"],
    item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "bundleDeactivatedOn": bundleDeactivatedOn.toIso8601String(),
    "bundleActivatedOn": bundleActivatedOn.toIso8601String(),
    "bundleActiveStatus": bundleActiveStatus,
    "bundleIndex": bundleIndex,
    "bundlePrice": bundlePrice,
    "bundleTag": bundleTag,
    "item": List<dynamic>.from(item.map((x) => x.toJson())),
    "__v": v,
  };
}

class Item {
  Item({
    required this.id,
    required this.itemCode,
    required this.itemName,
    required this.quantity,
    required this.brand,
    required this.price,
  });

  String id;
  String itemCode;
  String itemName;
  int quantity;
  String brand;
  int price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["_id"],
    itemCode: json["itemCode"],
    itemName: json["itemName"],
    quantity: json["quantity"],
    brand: json["brand"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "itemCode": itemCode,
    "itemName": itemName,
    "quantity": quantity,
    "brand": brand,
    "price": price,
  };
}
