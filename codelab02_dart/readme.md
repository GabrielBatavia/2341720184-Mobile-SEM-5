# Tugas Praktikum

## Soal 1 
### Modifikasilah kode pada baris 3 di VS Code atau Editor Code favorit Anda berikut ini agar mendapatkan keluaran (output) sesuai yang diminta!

Source :


```dart
void main() {
  for (int i = 0; i < 10; i++) {
    print('Nama saya adalah Gabriel Batavia, sekarang berumur ${18-i}');
  }
}
```

#### Output :
<img width="987" height="370" alt="image" src="https://github.com/user-attachments/assets/94177d06-1a85-4d85-939e-58d0dc8ae423" />



## Soal 2
### Mengapa sangat penting untuk memahami bahasa pemrograman Dart sebelum kita menggunakan framework Flutter ? Jelaskan!

 memahami bahasa Dart sebelum Flutter karena Flutter dibangun di atas Dart. Dengan menguasai dasar-dasar Dart kita bisa lebih mudah memahami logika dan sintaks dalam pengembangan aplikasi Flutter.

---
## Soal 3 
### Rangkumlah materi dari codelab ini menjadi poin-poin penting yang dapat Anda gunakan untuk membantu proses pengembangan aplikasi mobile menggunakan framework Flutter.

Dart dipilih sebagai bahasa utama Flutter karena modern, lintas platform, dan terus berkembang. Bahasa ini fleksibel serta mudah dipelajari.

**Karakteristik Dart:**
- **Productive tooling**: IDE support, analisis kode, ekosistem paket luas.  
- **Garbage collection**: Manajemen memori otomatis.  
- **Type system**: Mendukung anotasi tipe, type inference, dan keamanan tipe.  
- **Portability**: Bisa dikompilasi ke JavaScript untuk web atau native (ARM/x86).  

**Mengapa Penting dalam Flutter:**  
Semua kode di Flutter ditulis dalam Dart, termasuk aplikasi, plugin, hingga manajemen dependensi. Menguasai Dart membuat pengembangan lebih nyaman dan produktif.

**Struktur Bahasa:**  
Sintaks mirip C/JavaScript, ada tipe data bawaan, operator standar, serta kontrol alur. Dart juga sepenuhnya berorientasi objek (OOP) dengan konsep encapsulation, inheritance, abstraction, polymorphism.

**Operator Dart:**  
- Aritmatika: `+ - * / ~/ %`  
- Increment/decrement: `++ --`  
- Relasional: `== != > < >= <=`  
- Logika: `! || &&`  

Dengan pemahaman ini, developer lebih percaya diri menulis kode Flutter.

---

## Soal 4

### Buatlah penjelasan dan contoh eksekusi kode tentang perbedaan Null Safety dan Late variabel !

**Null Safety**  
Digunakan untuk mencegah error akibat nilai `null` yang tidak terduga.  
```dart
String? nama; // bisa null
String alamat = "Jakarta"; // tidak bisa null
````

**Late Variable**
Untuk variabel yang nilainya ditentukan belakangan, tapi wajib diinisialisasi sebelum dipakai.

```dart
late String judul;
judul = "Belajar Flutter";
print(judul); // aman
```

**Perbedaannya**:

* *Null Safety* fokus pada keamanan terhadap nilai `null`.
* *Late* fokus pada penundaan inisialisasi variabel, tetapi tetap harus diberi nilai sebelum digunakan.

