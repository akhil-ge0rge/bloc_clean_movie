import 'dart:developer';

import 'package:bloc_clean/repository/auth/login_repository.dart';
import 'package:bloc_clean/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../services/session_manager/session_controller.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<EmailChangeEvent>(_emailChange);
    on<PasswordChangeEvent>(_passwordChange);
    on<SubmitButtonEvent>(_submitButton);
  }

  void _emailChange(EmailChangeEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordChange(PasswordChangeEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _submitButton(SubmitButtonEvent event, Emitter<LoginState> emit) async {
    Map<String, dynamic> data = {
      "email": state.email,
      "password": state.password
    };
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    await loginRepository.loginApi(data).then(
      (value) async {
        if (value.error.isNotEmpty) {
          emit(
            state.copyWith(
              postApiStatus: PostApiStatus.error,
              message: value.error.toString(),
            ),
          );
        } else {
          await SessionController().saveUserValueInPrefernces(value);
          await SessionController().getUserFromPreferences();
          emit(
            state.copyWith(
              message: 'Login Sucessful',
              postApiStatus: PostApiStatus.sucess,
            ),
          );
        }
      },
    ).onError(
      (error, stackTrace) {
        emit(
          state.copyWith(
            postApiStatus: PostApiStatus.error,
            message: error.toString(),
          ),
        );
      },
    );
  }
}
