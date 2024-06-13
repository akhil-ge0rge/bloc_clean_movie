import 'package:bloc_clean/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_clean/main.dart';
import 'package:bloc_clean/view/login/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final emailFocousNode = FocusNode();

  final passwordFocousNode = FocusNode();

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _loginBloc = LoginBloc(loginRepository: getIt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: BlocProvider(
          create: (context) => LoginBloc(loginRepository: getIt()),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EmailInputWidget(emailFocousNode: emailFocousNode),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordInputField(passwordFocousNode: passwordFocousNode),
                    const SizedBox(
                      height: 50,
                    ),
                    LoginButton(
                      formKey: formKey,
                    ),
                  ],
                )),
          ),
        ));
  }
}
