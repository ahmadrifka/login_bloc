import 'package:bloc_login/bloc/login/login.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group('Login Event', (){
    
    group('LoginWithCredentials', (){
      String emailTest = 'email@test.com';
      String passTest = 'passwordTest';
      
      test('get props credential', () {
        expect(
            LoginWithCredentialsPressed(email: emailTest, password: passTest).props,
            ['$emailTest', '$passTest']);
      });
      
      test('toString LoginWithCredentials', (){
        expect(LoginWithCredentialsPressed(email: emailTest, password: passTest).toString(),
            'LoginWithCredentialsPressed { email: $emailTest, password: $passTest }'
        );
      });
    });
    
    group('EmailChanged', (){
      String emailTest = 'test@email.com';

      test('input EmailChanged', (){
        expect(EmailChanged(email: emailTest).props, ['$emailTest']);
      });

      test('toString EmailChanged', (){
        expect(EmailChanged(email: emailTest).toString(), 'EmailChanged { email :$emailTest }');
      });


    });
    
    
  });


}