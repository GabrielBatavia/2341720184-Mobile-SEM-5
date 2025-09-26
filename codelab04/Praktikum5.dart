(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void main() {

  var record = ('first', a: 2, b: true, 'last');
  print(record);

  final sebelum = (10, 20);
  final sesudah = tukar(sebelum);
  print('sebelum: $sebelum  →  sesudah: $sesudah');

  (String, int) mahasiswa = ('Gabriel Batavia Xaverius', 2341720184);
  print('mahasiswa: $mahasiswa');
  print('nama: ${mahasiswa.$1}, nim: ${mahasiswa.$2}');
  var (nama, nim) = mahasiswa;
  print('destructure → nama: $nama, nim: $nim');


  var mahasiswa2 = ('first', a: 2341720184, b: 'GabrielBataviaXaverius', 'last');
  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'

}