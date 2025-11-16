# Codelab 11

# Praktikum 1 

## Soal 3
1. Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!

    Jawab :

    substring(0, 450) memotong teks JSON agar hanya 450 karakter pertama yang ditampilkan.
Ini membuat tampilan lebih rapi, tidak terlalu panjang, dan tidak melebihi layar.


2. Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 3"
    
    Jawab :

    ![Screenshot](img/Screenshot1.png)

# Praktikum 2

## Soal 4

1. Jelaskan maksud kode langkah 1 dan 2 tersebut!

   Jawab :

   Ketiga method returnOneAsync(), returnTwoAsync(), returnThreeAsync() dibuat untuk mensimulasikan operasi asynchronous yang masing-masing: 
   menunggu 3 detik
   lalu mengembalikan nilai 1, 2, dan 3.
   Tujuan utamanya adalah menunjukkan cara menggunakan async dan await tanpa callback .then().
   Setiap method hanya akan selesai setelah await selesai menunggu delay.

2. Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 4"
    
    Jawab :

    ![Screenshot](img/Screenshot2.png)
   


# Praktikum 3

## Soal 5

1. Jelaskan maksud kode langkah 2 tersebut!

   Jawab :
   
   Completer digunakan untuk membuat Future secara manual, bukan menggunakan async/await langsung.

   getNumber() membuat objek Completer<int>() dan memulai proses calculate().
   
   Method calculate() berjalan asynchronous dan menunggu 5 detik.

2. Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 5".

   Jawab : 
   
   ![Screenshot](img/Screenshot3.png)


## Soal 6

1. Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!

   Jawab :

   Perbedaan utama antara langkah 2 dan langkah 5–6 adalah penanganan error

2. Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 6".
   
   Jawab :

   ![Screenshot](img/Screenshot4.png)

