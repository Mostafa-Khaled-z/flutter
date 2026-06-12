import 'package:cloths_chance2/view/Homepage.dart';
import 'package:cloths_chance2/viewmodel/Cartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main (){
  runApp(
    ChangeNotifierProvider(
      create: (context)=> Cartprovider(),
      child: MyApp(), )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}