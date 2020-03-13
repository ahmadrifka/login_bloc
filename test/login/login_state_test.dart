import 'package:bloc_login/bloc/login/login.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

    group('LoginState', (){

      group('Login condition', (){
          test('login state when empty', (){
            expect(LoginState.empty(),LoginState(isEmailValid: true, isPasswordValid: true, isSubmitting: false,
            isFailure: false, isSuccess: false
            ));
          });

          test('login state when loading', (){
            expect(LoginState.loading(), LoginState(
              isEmailValid: true,
              isPasswordValid: true,
              isSubmitting: true,
              isSuccess: false,
              isFailure: false
            ));
          });

          test('login state when success', (){
            expect(LoginState.success(), LoginState(
              isEmailValid: true,
              isPasswordValid: true,
              isSubmitting: false,
              isSuccess: true,
              isFailure: false
            ));
          });

          test('login state when failure', (){
            expect(LoginState.failure(), LoginState(
              isEmailValid: true,
              isPasswordValid: true,
              isSubmitting: false,
              isSuccess: false,
              isFailure: true,
            ));
          });
      });

      test('toString LoginState', (){
        expect(LoginState(isEmailValid: false, isPasswordValid: false, isSubmitting: false, isSuccess: false, isFailure: false).toString(),
            '''LoginState {
      isEmailValid: false,
      isPasswordValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    }''');
      });


    });

}