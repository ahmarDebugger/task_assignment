import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:task_assignment/data/api_client.dart';
import 'package:task_assignment/data/repo/get_items_repo.dart';
import 'package:task_assignment/data/repo/get_items_repo_imp.dart';
import 'package:task_assignment/route_generator.dart';
import 'package:task_assignment/ui/get_item/get_item_screen.dart';

import 'data/appmodel.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  GetIt.I.registerSingleton<ApiClient>(ApiClient());

  GetIt.I.registerSingleton<AppModel>(AppModel());
  GetIt.I.registerSingleton<GetItemsRep>(GetItemsRepoImp());

  await GetIt.I.allReady();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (context) => GetIt.I.get<AppModel>(),
        child: Consumer<AppModel>(
            builder: (context, model, _) {
              return MaterialApp(
                theme: ThemeData(
                ),
                debugShowCheckedModeBanner: false,
                initialRoute: GetItemScreen.routName,
                onGenerateRoute: (settings) => generateRoute(settings),
              );
            }));
  }
}
