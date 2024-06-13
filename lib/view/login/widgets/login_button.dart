import 'dart:developer';

import 'package:bloc_clean/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_clean/config/routes/route_name.dart';
import 'package:bloc_clean/utils/enums.dart';
import 'package:bloc_clean/utils/flush_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginButton extends StatelessWidget {
  final formKey;
  const LoginButton({super.key, this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.postApiStatus != current.postApiStatus,
      listener: (context, state) {
        switch (state.postApiStatus) {
          case PostApiStatus.error:
            FlushBarHelper.flushBarMessage(
                isError: true,
                message: state.message.toString(),
                context: context);
          case PostApiStatus.sucess:
            Navigator.of(context).pushReplacementNamed(RouteName.homeScreen);
          default:
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) =>
            previous.postApiStatus != current.postApiStatus,
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(SubmitButtonEvent());
              }
            },
            child: state.postApiStatus == PostApiStatus.loading
                ? const CircularProgressIndicator.adaptive()
                : const Text("Login"),
          );
        },
      ),
    );
  }
}
