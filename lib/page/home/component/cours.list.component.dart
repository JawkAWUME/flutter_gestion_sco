import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gestion_sco/core/constantes/sixe.constant.dart';
import 'package:flutter_gestion_sco/core/models/cours.model.dart';
import 'package:flutter_gestion_sco/core/service/cours.service.dart';

class CoursList extends StatefulWidget {
  const CoursList({super.key});

  @override
  State<CoursList> createState() => _CoursListState();
}

class _CoursListState extends State<CoursList> {
  List<Cours> cours = CoursService().findAll();
  int coursSelected=0;
  @override
  Widget build(BuildContext context) {
      return Padding(
      padding: const EdgeInsets.symmetric(vertical: lucPadding),
      child: SizedBox(
        height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cours.length,
        itemBuilder: (context,index){
          return InkWell(
            onTap: (){
              setState(() {
                coursSelected=index;
              });

            },
            child: Container(
              decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10)
              ),
            //  color: Colors.amber,
              height: 50,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(lucPadding),
              child: Center(child: Text(cours[index].libelle,style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),)),
            ),
          );
        }
      ),
      )
    );
  }
}