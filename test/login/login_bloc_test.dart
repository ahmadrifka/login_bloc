import 'package:bloc_login/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:bloc_login/bloc/login/login.dart';
import 'package:bloc_login/data/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockUserRepository extends Mock implements UserRepository{}

class MockAunthenticationBloc extends Mock implements AuthenticationBloc{}

void main(){
  LoginBloc loginBloc;
  MockUserRepository userRepository;
  MockAunthenticationBloc aunthenticationBloc;

  setUp(() {
    userRepository = MockUserRepository();
    aunthenticationBloc = MockAunthenticationBloc();
    loginBloc = LoginBloc(
      userRepository: userRepository
    );
  });

  tearDown((){
    loginBloc?.close();
    aunthenticationBloc?.close();
  });

  test('throw AssertionError when user is null', (){
    expect(() => LoginBloc(userRepository: null), throwsAssertionError);
  });

  test('initial state is correct', (){
    expect(LoginState.empty(), loginBloc.initialState);
  });
  
  test('close does not emit new state', (){
    expectLater(loginBloc, emitsInOrder([LoginState.empty(), emitsDone]));
  });
  

  //error during the credential button and token not equals
  group('LoginButtonPressed', (){
    LoginWithCredentialsPressed loginCredentials = LoginWithCredentialsPressed(email: 'valid.user', password: 'valid.user');
//    blocTest('emits [LoginLoading, LoginInitial] and token on success ',
//
//        build: () async {
//          when(userRepository.authenticated(username: 'valid.user', password: 'valid.password')).thenAnswer((realInvocation) => Future.value('token'));
//          return loginBloc;
//        },
//        act: (bloc) => bloc.add(loginCredentials),
//        expect: [
//          LoginState.loading(),
//          LoginState.success(),
//        ],
//        verify: (_) async {
//          verify(aunthenticationBloc.add(LoggedIn(token: 'token'))).called(1);
//        });
    
  });




}