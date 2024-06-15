import 'package:flutter_gestion_sco/core/models/etudiant.model.dart';

class EtudiantService {
  
  List<Etudiant> findAll(){
    return [
      Etudiant(id: 1, matricule: "FC523", tuteur:"Moktar",nomComplet:"sally Sow"),
      Etudiant(id: 2, matricule: "AM543", tuteur:"BALY",nomComplet:"Bouna Ba"),
      Etudiant(id: 1, matricule: "HR753", tuteur:"Moktar",nomComplet:"Aliou Samp"),
      Etudiant(id: 1, matricule: "RJF3", tuteur:"BOULAR",nomComplet:"Toure"),
      Etudiant(id: 1, matricule: "FH43", tuteur:"BAILA",nomComplet:"DIAW"),
      Etudiant(id: 1, matricule: "CHR563", tuteur:"SEKO",nomComplet:"NDAW BA"),
      Etudiant(id: 1, matricule: "FJ83", tuteur:"NDEYE",nomComplet:"COUNTY"),

    
      ];
  }
}