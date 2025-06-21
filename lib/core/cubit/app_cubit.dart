import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/core/cubit/app_states.dart';
import 'package:tasks/models/data.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super (InitialState());
  static AppCubit get(context)=>BlocProvider.of(context);
  List<DataModel>products=[];
  Future <void> gettingData()async{
    emit(LoadingData());
   try{
     final response = await Dio().get('https://fakestoreapi.com/products/category/jewelery');
     final List data = response.data;
     products = data.map((element)=>DataModel.fromJson(element)).toList();
     emit(GetDataSuccessfully(products));
   }catch (error){
      print(error.toString());
      emit(ErrorLoadingData(error.toString()));
    }
  }
}