import 'package:get_it/get_it.dart';
import 'package:task_assignment/data/base/base_vm.dart';
import 'package:task_assignment/data/model/items.dart';
import 'package:task_assignment/data/repo/get_items_repo.dart';

class GetItemVm extends BaseVM {

  final repo = GetIt.I.get<GetItemsRep>();
  int _builderIndex = 0;
   ItemsModel? _items;
  bool _isLoading=true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  int get builderIndex => _builderIndex;

  set builderIndex(int value) {
    _builderIndex = value;
    isLoading=true;
    getItems();
  }

  ItemsModel? get items => _items;

  set items(ItemsModel? value) {
    _items = value;
    notifyListeners();
  }

  getItems()async {
    await repo.getItems(builderIndex).then((value) {
     items = value;
      print("My Items :${items!.itemList.length}");
     isLoading = false;
    });

  }
}