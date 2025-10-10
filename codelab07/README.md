## Praktikum 1

1. Selesaikan Praktikum tersebut, lalu dokumentasikan dan push ke repository Anda berupa screenshot hasil pekerjaan beserta penjelasannya di file README.md!

<br>

2. Jelaskan maksud dari langkah 2 pada praktikum tersebut!

Jawab :


Langkah ini bertujuan untuk menginstal plugin auto_size_text dari pub.dev ke dalam project Flutter.
Perintah

```dart
flutter pub add auto_size_text
```

akan menambahkan dependensi plugin tersebut ke file pubspec.yaml, sehingga bisa digunakan di dalam kode untuk membuat teks otomatis menyesuaikan ukuran font-nya agar tetap muat dalam area tampilan.

<br>

3. Jelaskan maksud dari langkah 5 pada praktikum tersebut!

Jawab :

Langkah ini bertujuan untuk memberikan data teks dari luar widget ke dalam RedTextWidget.
Dengan menambahkan:

```dart
final String text;
const RedTextWidget({Key? key, required this.text}) : super(key: key);
```

maka widget RedTextWidget bisa menerima nilai teks dari widget lain (misalnya dari main.dart), dan menampilkannya di dalam AutoSizeText.

<br>

4. Pada langkah 6 terdapat dua widget yang ditambahkan, jelaskan fungsi dan perbedaannya!

Jawab :

Terdapat dua widget dalam children:

RedTextWidget (dengan AutoSizeText)

Menggunakan plugin auto_size_text.

Teks berwarna merah, otomatis mengecil jika tidak muat, maksimal 2 baris, dan menampilkan ... jika terpotong.

Text Widget Biasa

Menggunakan widget bawaan Flutter (Text).

Ukuran teks tetap dan tidak akan menyesuaikan jika teks terlalu panjang.

Perbedaan utama: AutoSizeText menyesuaikan ukuran teks secara otomatis, sedangkan Text tidak.


<br>

5. Jelaskan maksud dari tiap parameter yang ada di dalam plugin auto_size_text berdasarkan tautan pada dokumentasi ini !

Jawab :

| Parameter    | Fungsi                                                                                   |
| ------------ | ---------------------------------------------------------------------------------------- |
| **text**     | Teks yang akan ditampilkan.                                                              |
| **style**    | Menentukan gaya teks seperti warna, ukuran font, dan ketebalan.                          |
| **maxLines** | Jumlah maksimum baris teks yang boleh ditampilkan.                                       |
| **overflow** | Cara menampilkan teks jika melebihi batas (misalnya `ellipsis` untuk menampilkan “...”). |


<br>

6. Kumpulkan laporan praktikum Anda berupa link repository GitHub kepada dosen!