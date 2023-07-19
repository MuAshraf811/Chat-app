import 'package:bloc/bloc.dart';
import 'package:chat/features/logIn/view/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'log_in_bloc_event.dart';
part 'log_in_bloc_state.dart';

class LogInBlocBloc extends Bloc<LogInBlocEvent, LogInBlocState> {
  LogInBlocBloc() : super(LogInBlocInitial()) {
    on<LogInAuth>((event, emit) async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: LogIn.emailController.value.text,
          password: LogIn.passWordController.value.text,
        );
        emit(SuccessLoged());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(NoUserFound());
        } else if (e.code == 'wrong-password') {
          emit(WrongPassword());
        }
      } catch (error) {
        emit(ErrorLoged(error: error.toString()));
      }
    });
  }
}
