import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

import '../../../bloc/register/register_bloc.dart';
import '../../../components/already_have_account.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_name_field.dart';
import '../../../components/rounded_password_field.dart';
import '../../welcome/components/background.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);


    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              RoundedNameField(
                hintText: "Your Name",
                textEditingController: nameController,
                vaildator: (value) {
                  if (value!.length < 4) {
                    return 'Name should be more than 4 characters';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Username",
                textEditingController: usernameController,
                validator: (value) {
                  if (value!.length < 4) {
                    return 'Username should be more than 4 characters';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                textEditingController: passwordController,
                validator: (value) {
                  if (value!.length < 4) {
                    return 'Password should be more than 4 characters';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<RegisterBloc>().add(
                      RegisterSubmitEvent(
                        name: nameController.text,
                        username: usernameController.text,
                        password: passwordController.text,
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                 /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );*/
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}