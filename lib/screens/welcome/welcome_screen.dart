import 'package:bloc_pattern/screens/welcome/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authentication/authentication_bloc.dart';
import '../../bloc/register/register_bloc.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      body: Body(),
    );
  }
}