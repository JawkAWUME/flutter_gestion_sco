import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_gestion_sco/core/constantes/sixe.constant.dart';
import 'package:flutter_gestion_sco/core/models/etudiant.model.dart';
import 'package:flutter_gestion_sco/core/service/etudiant.service.dart';


///nouvelle approche de faire on utilise un stateLess et StateFull
///le stateLess c est pour le widget de la liste
class EtudiantList extends StatelessWidget {
  List<Etudiant> produits= EtudiantService().findAll();
   EtudiantList({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 150,
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          children:List.generate(produits.length, (index){
            return Center(
              child: EtudiantItem(etudiant: produits[index],callBack: (){

              },),
            );
          })
          ),
           
      );
    
  }
}

//statefull c est le widget d unproduit
class EtudiantItem extends StatefulWidget {
  Etudiant etudiant;
  VoidCallback callBack;  //on lui passe le produit et le callback pour l action a faire
  EtudiantItem({super.key, required this.etudiant,required this.callBack });

  @override
  State<EtudiantItem> createState() => _EtudiantItemState();
}

class _EtudiantItemState extends State<EtudiantItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 200,
        width: 200,
         decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10)
              ),
        padding: const EdgeInsets.all(lucPadding),
        child: Hero(tag: "${widget.etudiant.id}",
       child: Column(
        children: [
          Text(widget.etudiant.nomComplet),
          Text("${widget.etudiant.matricule} "),
         Positioned(
            top: 0,
            right: 0,
            child: const Icon(Icons.arrow_forward)) ,
          AspectRatio(aspectRatio: 1.8,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5)
            ),
          ),)
        ],
      ),      
         //espace
      ),
      )
      );
  }
}