
void main() {

  final list = List<dynamic>.filled(5, null, growable: false);

  list[1] = 'Gabriel Batavia Xaverius';    
  list[2] = '2341720184';  

  print('Panjang list: ${list.length}'); // 5
  print('Isi list    : $list');          
  print('Index 1 (Nama): ${list[1]}');
  print('Index 2 (NIM) : ${list[2]}');

}