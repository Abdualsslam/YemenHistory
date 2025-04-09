import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  late String? emailAddress;
  late String? password;
  late String? firstName;
  late String? lastName;
  signUpWithEmailAndPassword() async {
    emit(SignupLoadingState());
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailAddress!, password: password!);
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignupFailurState(error: e.message.toString()));
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      emit(SignupFailurState(error: e.toString()));
      print(e);
    }
  }
}
