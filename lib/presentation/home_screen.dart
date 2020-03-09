import 'package:bloc_login/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:bloc_login/bloc/authentication_bloc/authentication_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatelessWidget {
  final String name;

  const Homescreen({Key key, this.name}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app), 
          onPressed: (){
            BlocProvider.of<AuthenticationBloc>(context ).add(LoggedOut());
          })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(child: Text('Welcome $name!'),)
        ],
      ),
    );
  }
}