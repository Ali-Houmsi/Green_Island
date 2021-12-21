import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/login_screen.dart';
import 'package:udemy_flutter/messenger_screen.dart';
import 'layout/home_layout.dart';
import 'modules/opt_text/opt_text_screen.dart';
import 'shared/components/bloc_observer.dart';
import 'package:bloc/bloc.dart';

void main()
{
  //Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}



class MyApp extends StatelessWidget
{
 
  // constructor
  // build

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}