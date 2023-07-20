import 'package:bloc/bloc.dart';
import 'package:chat/features/register/view/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBlocBloc() : super(AuthBlocInitial()) {
    on<RegiserAndAuth>(
      (event, emit) async {
        try {
          final res =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: RegisterView.emailControllerRegister.text,
            password: RegisterView.passWord1ControllerRegister.text,
          );
          final shar = await SharedPreferences.getInstance();
          shar.setString('userId', res.credential!.providerId.toString());
          if (kDebugMode) {
            print('Hello there , afer successful registeration');
            print(res.credential);
            print(res.credential!.providerId);
            print(res.credential!.accessToken);
            print(res.credential!.token);
            print(res.credential!.signInMethod);
            print(res.additionalUserInfo);
          }
          emit(SuccessAuth());
        } on FirebaseAuthException catch (error) {
          if (error.code == 'weak-password') {
            emit(WeakPasswordError());
          } else if (error.code == 'email-already-in-use') {
            emit(AlreadyExistError());
          }
        } catch (e) {
          emit(ErrorWhileAuth(error: e.toString()));
        }
      },
    );
  }
}
