import 'package:cooknotes/services/user_data_service.dart';
import 'package:get_it/get_it.dart';

import 'models/mock_user.dart';

final service = GetIt.instance;

void init() {
  service.registerLazySingleton<UserDataService>(() => UserDataServiceMock());
}
