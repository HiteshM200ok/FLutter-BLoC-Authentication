import 'package:bloc_pattern/screens/register/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/register/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterUserExists) {
              SnackBar snackBar = const SnackBar(
                content: Text('User already exists'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }

            if (state is RegisterSuccess) {
              /*Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );*/
            }
          },
          child: Body(),
        ),
      ),
    );
  }
}