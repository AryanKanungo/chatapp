import 'package:chatapp1/consts.dart';
import 'package:chatapp1/widgets/custom_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 40.0,
        ),
        child: Column(
          children: [
            _headerText(),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _headerText() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi, Welcome Back!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            "Hello again! You have been missed!",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.2,
      ),
      child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomFormField(
                height: MediaQuery.sizeOf(context).height * 0.1,
                hintText: "Email",
                obscureText: false,
                validationRegEx: EMAIL_VALIDATION_REGEX,
              ),
              CustomFormField(
                height: MediaQuery.sizeOf(context).height * 0.1,
                hintText: "Password",
                obscureText: true,
                validationRegEx: PASSWORD_VALIDATION_REGEX,
              ),
              _loginButton(),
              _createAccountLink()
            ],
          )),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: MaterialButton(
        onPressed: () {
          if (_loginFormKey.currentState?.validate() ?? false) {
            print("WOoohoo");
          }
        },
        color: Theme.of(context).colorScheme.primary,
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _createAccountLink() {
    return Expanded(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.grey),
        ),
        const Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    ));
  }
}
