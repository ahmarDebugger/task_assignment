import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_assignment/ui/get_item/get_item_screen.dart';
import 'package:task_assignment/ui/get_item/get_item_vm.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case GetItemScreen.routName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => GetItemVm(), child:const GetItemScreen()));
    default:
      return errorRoute();
  }
}

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Arggg!'),
        ),
        body: const Center(
          child: Text('Oh No! You should not be here! '),
        ),
      );
    },
  );
}