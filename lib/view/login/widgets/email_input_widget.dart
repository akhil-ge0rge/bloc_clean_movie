import 'package:bloc_clean/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_clean/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocousNode;
  const EmailInputWidget({super.key, required this.emailFocousNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocousNode,
          decoration: const InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChangeEvent(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Email';
            }
            if (!Validation.emailValidator(value)) {
              return 'Email Not Valid';
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
