import 'package:get_it/get_it.dart';
import 'package:task_assignment/data/api_client.dart';

abstract class BaseRepo {
  ApiClient apiClient = GetIt.I.get<ApiClient>();
}