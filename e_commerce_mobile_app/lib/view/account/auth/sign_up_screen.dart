import 'package:e_commerce_mobile_app/component/input_outline_button.dart';
import 'package:e_commerce_mobile_app/component/input_text_button.dart';
import 'package:e_commerce_mobile_app/component/input_text_field.dart';
import 'package:e_commerce_mobile_app/controller/controllers.dart';
import 'package:e_commerce_mobile_app/extension/string_extension.dart';
import 'package:e_commerce_mobile_app/view/account/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                "Create Account,",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Sign up to started!",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                ),
              ),
              const Spacer(flex: 3),
              InputTextField(
                title: "Full Name",
                textEditingController: fullNameController,
                validation: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              InputTextField(
                title: "E-mail",
                textEditingController: emailController,
                validation: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty";
                  } else if (!value.isValidEmail) {
                    return 'Please enter valid e-mail';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              InputTextField(
                title: "Password",
                obsecureText: true,
                textEditingController: passwordController,
                validation: (String? value) {
                  List<String> _validation = [];
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty";
                  } else {
                    if (!value.isValidPasswordHasNumber) {
                      _validation.add('Must contaion 1 number');
                    }
                    if (!value.isValidPasswordHasCapitalLetter) {
                      _validation.add('Must contain 1 capital letter');
                    }
                    if (!value.isValidPasswordHasLowerCaseLetter) {
                      _validation.add('Must contain 1 simple letter');
                    }
                    if (!value.isValidPasswordHasSpecialCharacter) {
                      _validation
                          .add('Must contain 1 special character[ ! @ # \$ ½]');
                    }
                  }
                  String msg = '';
                  if (_validation.isNotEmpty) {
                    for (var i = 0; i < _validation.length; i++) {
                      msg = msg + _validation[i];
                      if ((i + 1) != _validation.length) {
                        msg = msg + '\n';
                      }
                    }
                  }
                  return msg.isNotEmpty ? msg : null;
                },
              ),
              const SizedBox(height: 15),
              InputTextField(
                title: "Confirm Password",
                obsecureText: true,
                textEditingController: confirmPasswordController,
                validation: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty";
                  } else if (passwordController.text != value) {
                    return 'Confirm password does not match';
                  }
                  return null;
                },
              ),
              const Spacer(),
              InputTextButton(
                  title: 'Sign Up',
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      authController.signUp(
                        fullName: fullNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  }),
              const SizedBox(height: 10),
              InputOutlineButton(
                title: 'Back',
                onClick: () => Navigator.of(context).pop(),
              ),
              const Spacer(flex: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('I am already a member'),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        )),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      )),
    );
  }
}
