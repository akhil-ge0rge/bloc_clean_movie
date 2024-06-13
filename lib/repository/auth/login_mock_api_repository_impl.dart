import 'package:bloc_clean/repository/auth/login_repository.dart';

import '../../model/user/user_model.dart';

class LoginMockApiRepositoryImpl implements LoginRepository {
  @override
  Future<UserModel> loginApi(dynamic data) async {
    await Future.delayed(const Duration(seconds: 4));
    final response = {'token': "12345"};
    return UserModel.fromJson(response);
  }
}
