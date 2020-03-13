import 'package:bloc_login/bloc/authentication_bloc/authentication_event.dart';
import 'package:bloc_login/bloc/authentication_bloc/authentication_state.dart';
import 'package:bloc_login/data/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>{
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository}) : assert(userRepository != null), _userRepository = userRepository;
  
  @override
  AuthenticationState get initialState => Unintialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event)  async*{
    if (event is AppStarted){
      final bool hasToken = await _userRepository.hasToken();
      if(hasToken){
        yield Aunthenticated('test');
      }else {
        yield Unauthenticated();
      }
      print('auth_bloc');
      yield* _mapAppStartedToState();
    }else if( event is LoggedIn){
      yield* _mapLoggedInToState();
    }else if (event is LoggedOut){
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      print(isSignedIn);
      if(isSignedIn){
        final name = await _userRepository.getUser();
        yield Aunthenticated(name);
      }else{
        print('auth_bloc un');
       yield Unauthenticated();
      }
    } catch (e) {
      Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
   yield Aunthenticated(await _userRepository.getUser());
  }
  
  Stream<AuthenticationState> _mapLoggedOutToState() async* {
  yield Unauthenticated();
  _userRepository.signOut();
}
}