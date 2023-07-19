// ignore_for_file: avoid_print

import 'package:chat/core/constants.dart';
import 'package:chat/core/widgets/CustomButton.dart';
import 'package:chat/core/widgets/customSpace.dart';
import 'package:chat/core/widgets/customTextFormField.dart';
import 'package:chat/features/register/data/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register_Bloc/bloc/auth_bloc_bloc.dart';

class RegisterView extends StatelessWidget {
  static final TextEditingController emailControllerRegister =
      TextEditingController();
  static final TextEditingController passWord1ControllerRegister =
      TextEditingController();
  static final TextEditingController passWord2Controller =
      TextEditingController();
  static final TextEditingController firstNameController =
      TextEditingController();
  static final TextEditingController secondNameController =
      TextEditingController();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference instance =
        FirebaseFirestore.instance.collection('users');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('iTalk'),
      ),
      body: BlocConsumer<AuthBlocBloc, AuthBlocState>(
        listener: (context, state) {
          if (state is SuccessAuth) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Success Registration process'),
              backgroundColor: Colors.green,
            ));
            Navigator.pushNamed(context, kLogIn);
          } else if (state is AlreadyExistError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('This account already exists'),
              backgroundColor: Colors.red,
            ));
          } else if (state is WeakPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('password is weak try make it stronger than that'),
              backgroundColor: Colors.yellow,
            ));
          } else if (state is ErrorWhileAuth) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: registerFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomSpace(height: 32, width: double.infinity),
                    Text(
                      'Registeration',
                      style: TextStyle(
                        color: kAppColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const CustomSpace(height: 48, width: double.infinity),
                    Row(
                      //mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomTextFormField(
                            keyboardType: TextInputType.name,
                            obscure: false,
                            hint: 'First name',
                            suffixIcon: Icons.person,
                            controller: firstNameController,
                            validate: (val) {
                              if (val!.isEmpty) {
                                return 'This field should\'nt be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        const CustomSpace(height: 2, width: 16),
                        Expanded(
                          flex: 1,
                          child: CustomTextFormField(
                            keyboardType: TextInputType.name,
                            obscure: false,
                            hint: 'Last name',
                            suffixIcon: Icons.person,
                            controller: secondNameController,
                            validate: (val) {
                              if (val!.isEmpty) {
                                return 'This field should\'nt be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const CustomSpace(height: 24, width: double.infinity),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      obscure: false,
                      hint: 'E-mail address',
                      suffixIcon: Icons.email_rounded,
                      controller: emailControllerRegister,
                      validate: (val) {
                        if (val!.isEmpty) {
                          return 'This field should\'nt be empty';
                        } else if (val.length <= 8) {
                          return 'field length should be at least 8';
                        }
                        return null;
                      },
                    ),
                    const CustomSpace(height: 24, width: double.infinity),
                    CustomTextFormField(
                      keyboardType: TextInputType.number,
                      obscure: true,
                      hint: 'passWord',
                      suffixIcon: Icons.remove_red_eye_rounded,
                      controller: passWord1ControllerRegister,
                      validate: (valp) {
                        if (valp!.isEmpty) {
                          return 'This field should\'nt be empty';
                        } else if (valp.length <= 8) {
                          return 'Password length should be at least 8';
                        }
                        return null;
                      },
                    ),
                    const CustomSpace(height: 24, width: double.infinity),
                    CustomTextFormField(
                      keyboardType: TextInputType.number,
                      obscure: true,
                      hint: 'Confirm passWord',
                      suffixIcon: Icons.remove_red_eye_rounded,
                      controller: passWord2Controller,
                      validate: (valp2) {
                        if (valp2!.isEmpty) {
                          return 'This field should\'nt be empty';
                        } else if (passWord2Controller.value.text !=
                            passWord1ControllerRegister.value.text) {
                          return 'password dosn\'t match';
                        }
                        return null;
                      },
                    ),
                    const CustomSpace(height: 32, width: double.infinity),
                    CustomButton(
                      icon: Icons.fingerprint,
                      onPressed: () async {
                        BlocProvider.of<AuthBlocBloc>(context)
                            .add(RegiserAndAuth());
                        final UserModel userInfo = UserModel(
                          firstName: firstNameController.value.text,
                          lastName: secondNameController.value.text,
                          email: emailControllerRegister.value.text,
                        );
                        await instance.add(UserModel.toMap(userInfo));
                        if (registerFormKey.currentState!.validate()) {
                          return;
                        }
                      },
                      label: 'Regiser,now',
                    ),
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
