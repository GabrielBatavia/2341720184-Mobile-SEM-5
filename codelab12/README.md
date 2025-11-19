# Codelab12

## Praktikum 1

1. Jelaskan fungsi keyword yield* pada kode tersebut!

    Jawab : 

    yield* digunakan di dalam fungsi async* untuk meneruskan semua event dari stream lain ke stream yang sedang kita buat.
    Dalam kasus ini, kita tidak mengeluarkan satu nilai saja, tapi mendelegasikan seluruh aliran data dari Stream.periodic(...) ke getColors().

2. Apa maksud isi perintah kode tersebut?

Stream<Color> getColors() async* {
  yield* Stream.periodic(
    const Duration(seconds: 1),
    (int t) {
      final int index = t % colors.length;
      return colors[index];
    },
  );
}

    Jawab :

    Stream.periodic membuat stream yang mengeluarkan data setiap 1 detik.
    Parameter (int t) adalah counter: 0, 1, 2, 3, ... untuk setiap “tick”.
    int index = t % colors.length;
    supaya index selalu berputar di rentang 0 sampai colors.length - 1, jadi list warna akan loop terus.

    return colors[index];
    setiap 1 detik, stream mengirim satu warna dari list.

    yield* di depan Stream.periodic(...)
    membuat getColors() menyalurkan seluruh stream warna tersebut, sehingga siapa pun yang memanggil getColors() akan menerima warna baru setiap detik.


5. Jelaskan perbedaan menggunakan listen dan await for (langkah 9)!

    Jawab :

    await for dipakai di function async untuk menunggu event stream satu per satu seperti for loop biasa.
    Selama masih di dalam loop await for, fungsi ini “terkunci” di loop itu sampai stream selesai atau di-break.
    Cocok kalau kita ingin memproses stream secara berurutan dan hanya punya satu konsumen.

    ![Screenshot](img/Screenshot1.gif)


# Praktikum 2

6. Jelaskan maksud kode langkah 8 dan 10 tersebut!

    Jawab : 

    Langkah 8 menghubungkan NumberStream → StreamController → Stream → UI, jadi setiap angka baru yang kita kirim akan tampil di layar.
    Langkah 10 adalah tombol untuk mengirim angka random ke stream, sehingga nilai di layar berubah setiap kali tombol ditekan.

7. Jelaskan maksud kode langkah 13 sampai 15 tersebut!

    Jawab :

    Langkah 13 membuat fungsi untuk menyuntikkan error ke stream.
    Langkah 14 menambahkan handler onError sehingga UI bisa bereaksi terhadap error (menampilkan -1).
    Langkah 15 mengubah tombol agar memicu error daripada mengirim angka biasa, sehingga kita bisa melihat bagaimana error diproses oleh stream.

    ![Screenshot](img/Screenshot2.gif)


# Praktikum 3