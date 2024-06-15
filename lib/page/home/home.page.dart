import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gestion_sco/page/home/component/cours.list.component.dart';
import 'package:flutter_gestion_sco/page/home/component/etudiant.list.component.dart';


import '../cart/cart.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String RouteName="/home";


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
           Navigator.pushNamed(context, CartPage.RouteName);
          }, icon: const Icon (Icons.shopping_cart))
        ],
        backgroundColor: Colors.blueAccent,
      ),
      
      drawer: Drawer(),
      body: Column(
      //  mainAxisAlignment: MainAxisAlignment.start,
        children:[
          const SizedBox(
            width: double.infinity,
            child: Text("cours",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),),
           const SizedBox(height: 10,),
           //Liste des cours
           CoursList(),
           Container(
           width: double.infinity,
       
        ),
        const SizedBox(
            width: double.infinity,
            child: Text("absences",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),),
            
        //Liste des produits
       EtudiantList(),
  ],)
    );
  }
  
}