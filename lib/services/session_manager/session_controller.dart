import 'dart:convert';
import 'dart:developer';

import 'package:bloc_clean/model/user/user_model.dart';
import 'package:bloc_clean/services/storage/local_storage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();
  final LocalStorage localStorage = LocalStorage();
  UserModel userModel = UserModel();
  bool? isLogin;
  SessionController._internal() {
    isLogin = false;
  }

  factory SessionController() {
    return _session;
  }
  Future<void> saveUserValueInPrefernces(dynamic user) async {
    localStorage.setValue(key: 'token', value: jsonEncode(user));
    localStorage.setValue(key: 'isLogin', value: 'true');
  }

  Future<void> getUserFromPreferences() async {
    try {
      var userDetails = await LocalStorage().readValue(key: 'token');
      var isLogin = await LocalStorage().readValue(key: 'isLogin');
      if (userDetails != null && userDetails.isNotEmpty) {
        log(userDetails);
        SessionController().userModel =
            UserModel.fromJson(jsonDecode(userDetails));
      }
      SessionController().isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      log('$e');
    }
  }
}
