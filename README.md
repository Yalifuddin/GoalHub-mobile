# football_shopA new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

## Jawaban Pertanyaan Tutorial

Berikut adalah jawaban dari pertanyaan-pertanyaan yang diberikan:

### 1. Apa itu widget tree pada Flutter dan bagaimana hubungan parent-child bekerja?

Dalam Flutter, seluruh antarmuka pengguna (UI) dibangun dari widget. *Widget tree* adalah representasi struktur dari semua widget yang Anda gunakan dalam aplikasi. Anggap saja seperti pohon silsilah keluarga, di mana ada satu widget akar (*root widget*), dan dari situ bercabang ke widget-widget lain yang lebih kecil. [13] Setiap widget dalam pohon ini mendeskripsikan bagian tertentu dari UI, mulai dari hal-hal struktural seperti `Scaffold` (kerangka halaman) dan `Column` (penyusun vertikal), hingga elemen yang terlihat seperti `Text`, `Button`, dan `Icon`. [17]

Hubungan *parent-child* (induk-anak) adalah inti dari cara kerja *widget tree*:
*   **Parent Widget (Induk):** Adalah widget yang "membungkus" atau berisi widget lain. Contohnya, sebuah `Column` adalah *parent* dari daftar widget yang ditampilkannya secara vertikal.
*   **Child Widget (Anak):** Adalah widget yang berada di dalam widget lain. Contohnya, beberapa widget `Text` bisa menjadi *children* dari sebuah `Column`.

Cara kerja hubungan ini adalah *parent widget* sering kali mengontrol bagaimana *child widget* akan ditampilkan (posisi, ukuran, dll.). Selain itu, beberapa properti seperti tema dapat diwariskan dari *parent* ke semua *children* di bawahnya.

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

Berikut adalah widget yang digunakan dalam proyek `football_shop`:

*   **MaterialApp**: Membungkus seluruh aplikasi dan menyediakan fungsionalitas dasar seperti routing, tema, dan navigasi. [19]
*   **Scaffold**: Menyediakan struktur dasar untuk halaman aplikasi, seperti `appBar` (bilah atas), `body` (konten utama), dan lainnya. [16]
*   **AppBar**: Widget yang ditampilkan di bagian atas layar, biasanya berisi judul halaman dan beberapa aksi.
*   **Padding**: Memberikan ruang (jarak) di sekitar *child*-nya.
*   **Column**: Menyusun *children*-nya dalam urutan vertikal.
*   **Center**: Menempatkan *child*-nya di tengah-tengah area yang tersedia.
*   **Text**: Menampilkan teks atau tulisan. [13]
*   **SizedBox**: Membuat sebuah kotak dengan ukuran tertentu, biasanya digunakan untuk memberi jarak antar widget.
*   **GridView**: Menampilkan widget dalam bentuk grid (kisi) yang dapat digulir.
*   **Material**: Memberikan properti visual dari Material Design, seperti warna latar, elevasi (bayangan), dan bentuk.
*   **InkWell**: Membuat area yang merespons sentuhan (seperti `onTap`) dan menampilkan efek riak saat ditekan.
*   **Icon**: Menampilkan sebuah ikon grafis dari set ikon yang tersedia. [16]
*   **StatelessWidget**: Kelas dasar untuk widget yang propertinya tidak dapat berubah (immutable). Contohnya `MyHomePage` dan `ItemCard`.
*   **Theme**: Digunakan untuk mengakses properti tema global, seperti skema warna.

### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

`MaterialApp` adalah widget fundamental yang membungkus seluruh aplikasi dan menyediakan banyak fitur penting yang diperlukan untuk aplikasi bergaya Material Design. [21] Fungsinya antara lain:
*   **Routing dan Navigasi**: Mengelola tumpukan halaman (rute) dan memudahkan navigasi antar layar. [8]
*   **Tema (Theming)**: Menyediakan `ThemeData` yang memungkinkan Anda menentukan skema warna dan gaya tipografi global untuk seluruh aplikasi. [8, 24]
*   **Integrasi Material Design**: Memastikan aplikasi Anda mengikuti pedoman Material Design secara keseluruhan. [8]
*   **Dukungan Lokalisasi**: Memudahkan pengembangan aplikasi multibahasa. [8]

`MaterialApp` sering digunakan sebagai *widget root* karena ia menyediakan semua konteks dan layanan dasar (seperti navigasi dan tema) yang dibutuhkan oleh sebagian besar widget lain di dalam aplikasi. Tanpa `MaterialApp`, widget seperti `Scaffold` dan `Navigator` tidak akan berfungsi dengan benar. [19]

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

Perbedaan utama terletak pada pengelolaan **state** (keadaan).

*   **StatelessWidget**: Adalah widget yang *immutable* (tidak dapat berubah). [11] Setelah dibuat, properti dan tampilannya tidak akan pernah berubah selama siklus hidupnya. Widget ini hanya digambar sekali dan tidak akan digambar ulang kecuali input eksternal berubah.
*   **StatefulWidget**: Adalah widget yang *mutable* (dapat berubah). [18] Ia memiliki objek `State` internal yang dapat menyimpan data yang bisa berubah. Ketika data di dalam `State` berubah (biasanya dengan memanggil `setState()`), widget ini akan memberi tahu Flutter untuk membangun ulang UI-nya untuk merefleksikan perubahan tersebut.

**Kapan memilihnya:**
*   Gunakan **StatelessWidget** ketika UI yang Anda buat bersifat statis dan tidak bergantung pada interaksi pengguna atau perubahan data internal. [11] Contoh: ikon, label teks statis, atau halaman "Tentang Kami".
*   Gunakan **StatefulWidget** ketika UI perlu diperbarui secara dinamis sebagai respons terhadap interaksi pengguna (misalnya menekan tombol), data yang masuk, atau perubahan internal lainnya. [23] Contoh: *checkbox*, formulir input, atau halaman yang menampilkan data *real-time*.

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

`BuildContext` adalah "penanda lokasi" yang memberi tahu setiap widget di mana posisinya berada di dalam *widget tree*. [6] Setiap widget memiliki `BuildContext`-nya sendiri, yang menjadi referensi ke lokasinya dan ke *parent*-nya. [1, 5]

**Pentingnya BuildContext**:
*   **Mencari Ancestor**: `BuildContext` digunakan untuk menemukan widget atau `State` leluhur (ancestor) dalam pohon. Contoh paling umum adalah `Theme.of(context)` yang mencari `Theme` terdekat ke atas, atau `Navigator.of(context)` untuk navigasi. [15]
*   **Akses ke Layanan**: Ia menyediakan akses ke layanan yang disediakan oleh widget leluhur, seperti tema, data media query (ukuran layar), dan navigasi. [2]

Di dalam metode `build`, `BuildContext` diterima sebagai parameter: `Widget build(BuildContext context)`. Parameter `context` inilah yang digunakan oleh *child widget* untuk berinteraksi dengan lingkungannya, misalnya mengambil skema warna dari tema (`Theme.of(context).colorScheme.primary`) atau berpindah halaman (`Navigator.push(...)`). [2]

### 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

**Hot Reload** dan **Hot Restart** adalah fitur yang mempercepat siklus pengembangan di Flutter. [9]

*   **Hot Reload**:
    *   **Apa yang dilakukan**: Menyuntikkan file kode sumber yang telah diperbarui ke dalam Dart Virtual Machine (VM) yang sedang berjalan. [9] Setelah itu, Flutter akan membangun ulang *widget tree*.
    *   **Keadaan (State)**: **Tidak hilang**. State dari `StatefulWidget` tetap dipertahankan. [7]
    *   **Kapan digunakan**: Ideal untuk perubahan UI cepat, seperti mengubah warna, tata letak, atau teks. [10] Ini memungkinkan developer melihat perubahan secara instan tanpa harus memulai ulang dari awal. [4]

*   **Hot Restart**:
    *   **Apa yang dilakukan**: Mereset seluruh aplikasi, menghancurkan state yang ada, dan memulai ulang aplikasi dari awal (menjalankan kembali fungsi `main()`). [7]
    *   **Keadaan (State)**: **Hilang**. Aplikasi kembali ke keadaan awal. [3]
    *   **Kapan digunakan**: Digunakan saat perubahan kode tidak dapat diterapkan dengan *hot reload*, seperti mengubah *global state*, menambahkan aset baru, atau mengubah logika di `initState()`. [10] Proses ini lebih cepat daripada "full restart" (menghentikan dan menjalankan ulang aplikasi sepenuhnya) tetapi lebih lambat dari *hot reload*. [3, 4]

Secara singkat, *hot reload* untuk perubahan visual cepat dengan state terjaga, sedangkan *hot restart* untuk perubahan struktural yang lebih dalam yang memerlukan reset state. [4]