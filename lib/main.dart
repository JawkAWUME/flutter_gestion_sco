import 'package:flutter/material.dart';
import 'package:flutter_gestion_sco/page/cart/cart.page.dart';
import 'package:flutter_gestion_sco/page/home/home.page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        
      ),
      initialRoute: "/home",
      routes: {
        "/home":(context)=> const HomePage(),
        "/cart":(context)=> const CartPage(),
      },
      home: const HomePage(),
    );
  }
}

  
  


