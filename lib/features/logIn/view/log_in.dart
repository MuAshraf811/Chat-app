import 'package:chat/core/constants.dart';
import 'package:chat/core/widgets/CustomButton.dart';
import 'package:chat/core/widgets/customSpace.dart';
import 'package:chat/core/widgets/customTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logIn_Bloc/bloc/log_in_bloc_bloc.dart';

class LogIn extends StatelessWidget {
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passWordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('italk'),
      ),
      body: BlocConsumer<LogInBlocBloc, LogInBlocState>(
        listener: (context, state) {
          if (state is SuccessLoged) {
            Future.delayed(const Duration(seconds: 1)).then((value) =>
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Hello and Welcome'),
                  backgroundColor: Colors.green,
                )));

            Navigator.pushNamed(context, kUserHomePage);
            emailController.clear();
            passWordController.clear();
          } else if (state is WrongPassword) {
            Future.delayed(const Duration(seconds: 1)).then((value) =>
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Wrong passWord'),
                  backgroundColor: Colors.red,
                )));
          } else if (state is NoUserFound) {
            Future.delayed(const Duration(seconds: 1)).then((value) =>
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('There is No such account'),
                  backgroundColor: Colors.red,
                )));
          } else if (state is ErrorLoged) {
            Future.delayed(const Duration(seconds: 1)).then(
                (value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.error),
                      backgroundColor: Colors.red,
                    )));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomSpace(height: 128, width: double.infinity),
                    Text(
                      'LogIn',
                      style: TextStyle(
                        color: kAppColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const CustomSpace(height: 24, width: double.infinity),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      obscure: false,
                      hint: 'Enter youe e-mail',
                      suffixIcon: Icons.email_outlined,
                      controller: emailController,
                      validate: (val) {
                        if (val!.isEmpty) {
                          return 'This field should\'nt be empty';
                        } else if (val.length <= 8) {
                          return 'field length should be at least 8';
                        }
                        return null;
                      },
                    ),
                    const CustomSpace(height: 32, width: double.infinity),
                    CustomTextFormField(
                      keyboardType: TextInputType.number,
                      obscure: true,
                      hint: 'Enter your passWord',
                      suffixIcon: Icons.remove_red_eye_rounded,
                      controller: passWordController,
                      validate: (val) {
                        if (val!.isEmpty) {
                          return 'This field should\'nt be empty';
                        } else if (val.length <= 8) {
                          return 'field length should be at least 8';
                        }
                        return null;
                      },
                    ),
                    const CustomSpace(height: 32, width: double.infinity),
                    CustomButton(
                        icon: Icons.key,
                        onPressed: () {
                          BlocProvider.of<LogInBlocBloc>(context)
                              .add(LogInAuth());

                          if (formKey.currentState!.validate()) {
                            return;
                          }
                        },
                        label: 'LogIN'),
                    const CustomSpace(height: 24, width: double.infinity),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, kRegister);
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: kAppColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
