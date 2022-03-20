import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_assignment/data/model/items.dart';
import 'package:task_assignment/ui/get_item/get_item_vm.dart';

class GetItemScreen extends StatefulWidget {
  static const  routName = '/';

  const GetItemScreen({Key? key}) : super(key: key);

  @override
  State<GetItemScreen> createState() => _GetItemScreenState();
}

class _GetItemScreenState extends State<GetItemScreen> {
  @override
  void initState() {
    getItems();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<GetItemVm>(builder:(context, vm , _){
      return  Scaffold(
        backgroundColor: Colors.blue.shade100,
        body:vm.isLoading?Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ): SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height:250,
                  decoration:const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(children: [
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Text(vm.builderIndex==1?"LARGE PACK":"SMALL PACK",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){
                              if(vm.builderIndex==0){
                                vm.builderIndex=1;
                              }
                              else{
                                vm.builderIndex=0;
                              }
                            },
                            child: Container(
                                width: 120,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:const Center(child: Text("CHANGE",style:
                                TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.normal),))),
                          ),
                        ],
                      ),
                    ),
                    for(var items in vm.items!.itemList[0].item)
                      myCard(items,vm),
                  ],),
                ),
              ),
              // ListView.builder(
              //     itemCount: vm.items!.itemList[0].item.length,
              //     itemBuilder: (context,index){
              //   return Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Container(
              //       width: MediaQuery.of(context).size.width,
              //       child: Text(vm.items!.itemList[0].item[index].itemName),
              //     ),
              //   );
              // }),
            ],
          ),
        ),
      );
    });
  }

  void getItems() async {
    await Future.delayed(const Duration(seconds: 1));
    Provider.of<GetItemVm>(context, listen: false).getItems();
  }

  myCard(Item items,GetItemVm vm) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
          color: int.parse(items.itemCode)==1 ?
          vm.builderIndex==1?Colors.yellow:
          vm.builderIndex==0?Colors.greenAccent:
          Colors.white:Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(items.itemName),
                  Text("x "+items.quantity.toString(),style: TextStyle(color: Colors.grey),),
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(""),
                  Text("PRICE",style: TextStyle(fontSize: 10),),
                  Text(items.price.toString(),style: TextStyle(color:items.price>1000?Colors.black: Colors.red,fontSize: 20),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
