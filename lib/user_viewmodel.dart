// The todo list is user-specific
import 'package:cooknotes/dependencies.dart';
import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/services/user_data_service.dart';
import 'package:cooknotes/viewmodel.dart';

class UserViewmodel extends Viewmodel {
  User users;

  UserViewmodel();
  UserDataService get dataService => service();

  Future<void> getUser() async {
    turnBusy();
    users = await dataService.getUser();
    turnIdle();
    // notifyListeners();
  }
}
