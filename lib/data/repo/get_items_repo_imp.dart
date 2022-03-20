import 'package:task_assignment/data/model/item_response_model.dart';
import 'package:task_assignment/data/model/items.dart';
import 'package:task_assignment/data/repo/get_items_repo.dart';

class GetItemsRepoImp extends GetItemsRep {
  @override
  Future<ItemsModel> getItems(index) async{
    return await apiClient.getItems(index);
  }


}