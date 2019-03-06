import 'package:flutter/material.dart';
import './ui/BMI.dart';

void main(){
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI App",
      home: new BMI(),
    )
  );
}