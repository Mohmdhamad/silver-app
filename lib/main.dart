import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasks/core/cubit/bloc_observer.dart';
import 'my_app.dart';

void main(){
  Bloc.observer =MyBlocObserver();
  runApp(MyApp());
}


