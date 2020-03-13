import 'package:bloc_login/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:bloc_login/bloc/authentication_bloc/authentication_event.dart';
import 'package:bloc_login/bloc/authentication_bloc/authentication_state.dart';
import 'package:bloc_login/data/repository/user_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main(){
  AuthenticationBloc authenticationBloc;
  MockUserRepository userRepository;

  setUp((){
    userRepository = MockUserRepository();
    authenticationBloc = AuthenticationBloc(userRepository: userRepository);
  });

  tearDown((){
    authenticationBloc?.close();
  });
  
  test('throw Assertion error when userReepository is null', (){
    expect(()=> AuthenticationBloc(userRepository: null), throwsAssertionError);
  });
  
  test('initial test is correct', (){
    expect(authenticationBloc.initialState, Unintialized());
  });
  
  test('close does not emit new states', (){
    expectLater(authenticationBloc, emitsInOrder([Unintialized(), emitsDone]));
    authenticationBloc.close();
  });

  group('AppStarted', (){

    blocTest('emits [unauthenticated] for valid token', build: () async {
      when(userRepository.hasToken()).thenAnswer((_) => Future.value(false));
      return authenticationBloc;
    },
    act: (bloc) => bloc.add(AppStarted()),
      expect: [
        Unauthenticated()
      ]
    );
    
    blocTest('emits[authenticated] for valid token', build: () async {
      when(userRepository.hasToken()).thenAnswer((realInvocation) => Future.value(true));
      return authenticationBloc;
    },
      act: (bloc) => bloc.add(AppStarted()),
      expect: [
        Aunthenticated('test')
      ]
    );
    
  });



  
}