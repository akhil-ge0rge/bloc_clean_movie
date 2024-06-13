import 'package:bloc_clean/config/app_url.dart';
import 'package:bloc_clean/data/network/network_services_api.dart';
import 'package:bloc_clean/model/user/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> loginApi(dynamic data);
}
