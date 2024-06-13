import 'package:bloc_clean/model/user/user_model.dart';
import 'package:bloc_clean/repository/auth/login_repository.dart';

import '../../config/app_url.dart';
import '../../data/network/network_services_api.dart';

class LoginHttpApiRepositoryImpl implements LoginRepository {
  final api = NetworkServicesApi();
  @override
  Future<UserModel> loginApi(dynamic data) async {
    final response = await api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}
