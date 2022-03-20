import 'package:task_assignment/data/base/base_repo.dart';
import 'package:task_assignment/data/model/item_response_model.dart';
import 'package:task_assignment/data/model/items.dart';

abstract class GetItemsRep extends BaseRepo {
  Future<ItemsModel> getItems(index);
}