
import 'package:flutter_gestion_sco/core/models/cours.model.dart';

class CoursService {
  
  List<Cours> findAll(){
    return [
      Cours(id: 1, libelle: "JAVA", VolumeHoraire:"23"),
      Cours(id: 2, libelle: "JS", VolumeHoraire:"27"),
      Cours(id: 3, libelle: "FLUTTER", VolumeHoraire:"29"),
      Cours(id: 4, libelle: "ANGULAR", VolumeHoraire:"33"),
      Cours(id: 5, libelle: "SPRING", VolumeHoraire:"29"),
      Cours(id: 6, libelle: "TS", VolumeHoraire:"23"),
      Cours(id: 7, libelle: "C#", VolumeHoraire:"30"),
      Cours(id: 8, libelle: "SYMFO", VolumeHoraire:"30"),
      Cours(id: 9, libelle: "PHP", VolumeHoraire:"33"),
      Cours(id: 10, libelle: "FLASK", VolumeHoraire:"24"),
      Cours(id: 11, libelle: "UML", VolumeHoraire:"24"),
      Cours(id: 12, libelle: "ALGO", VolumeHoraire:"30"),
      Cours(id: 13, libelle: "RESEAU", VolumeHoraire:"30"),
      Cours(id: 14, libelle: "LINUX", VolumeHoraire:"30"),


      ];
  }
}