import 'package:bloc_login/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:bloc_login/bloc/authentication_bloc/authentication_event.dart';
import 'package:bloc_login/bloc/delegate_bloc/simple_bloc_delegate.dart';
import 'package:bloc_login/data/repository/user_repository.dart';
import 'package:bloc_login/presentation/home_screen.dart';
import 'package:bloc_login/presentation/login/login_screen.dart';
import 'package:bloc_login/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/authentication_bloc/authentication_state.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlogDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
      ..add(AppStarted()),
      child: App(userRepository: userRepository,),
      )
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  const App({Key key, UserRepository userRepository}) : assert(userRepository != null), _userRepository = userRepository, super(key: key);

  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unintialized) {
            return Splashscreen();
          }
          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository);
          }
          if (state is Aunthenticated) {
            return Homescreen(name: state.displayName);
          }
          return null;
        },
      ),
    );
  }
}
