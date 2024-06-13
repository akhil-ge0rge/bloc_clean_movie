import 'package:bloc_clean/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordInputField extends StatelessWidget {
  final FocusNode passwordFocousNode;
  const PasswordInputField({super.key, required this.passwordFocousNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          focusNode: passwordFocousNode,
          decoration: const InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChangeEvent(password: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Password';
            }
            if (value.length < 6) {
              return "PASS LESSTHAN 6";
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
