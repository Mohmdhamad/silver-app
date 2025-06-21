import 'package:flutter/material.dart';
import '../../../../core/style/text_style.dart';

AppBar appBarHome(){
  return AppBar(
    title: Text('Jewelery Category',style: titleStyle(),),
    centerTitle: true,
  );
}