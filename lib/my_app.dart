import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/core/cubit/app_cubit.dart';
import 'package:tasks/features/home/view/screen/details_screen.dart';
import 'package:tasks/features/home/view/screen/home_screen.dart';

class MyApp extends StatelessWidget{
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (context)=>AppCubit()..gettingData(),
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

}