import 'package:collection/collection.dart';
void main(){
  final francais = Matiere([3.5,6.9,8.4,2.3,12.6]);
  final math = Matiere([5,6.9,12.4,12.3,15.6]);
  final informatique = Matiere([13.5,16.9,18.4,12.3,12.6]);
  
  print("Francais ${francais.moyenne()}");
  print("Mathématiques ${math.moyenne()}");
  print("Informatique ${informatique.moyenne()}");
  print("Générale ${moyenneGenerale([francais,math,informatique])}");
  
}

class Matiere{
  List<double> notes;

  Matiere(this.notes);

  double moyenne() => notes.reduce((a,b) => a+b) / notes.length;
}

double moyenneGenerale(List<Matiere> listMatieres)=>
  listMatieres.map(
          (matiere)=> matiere.moyenne())
      .reduce((a,b)=> a+b) / listMatieres.length;

    
    
    
    
    
    
    
    
    
    
    
    
    