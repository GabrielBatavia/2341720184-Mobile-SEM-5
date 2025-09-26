void main() {

  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names1 = <String>{};        
  Set<String> names2 = <String>{};

  names1.add('Gabriel Batavia Xaverius');  
  names1.add('2341720184');

  names2.addAll({'Gabriel Batavia Xaverius', '2341720184'}); 

  print(names1);
  print(names2); 

}