# football_shop

A new Flutter project.## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

## Tugas 7: Elemen Dasar Flutter

### 1. Apa itu widget tree pada Flutter dan bagaimana hubungan parent-child bekerja?

Dalam Flutter, seluruh antarmuka pengguna (UI) dibangun dari widget. *Widget tree* adalah representasi struktur dari semua widget yang Anda gunakan dalam aplikasi. Anggap saja seperti pohon silsilah keluarga, di mana ada satu widget akar (*root widget*), dan dari situ bercabang ke widget-widget lain yang lebih kecil. Setiap widget dalam pohon ini mendeskripsikan bagian tertentu dari UI, mulai dari hal-hal struktural seperti `Scaffold` (kerangka halaman) dan `Column` (penyusun vertikal), hingga elemen yang terlihat seperti `Text`, `Button`, dan `Icon`.

Hubungan *parent-child* (induk-anak) adalah inti dari cara kerja *widget tree*:
*   **Parent Widget (Induk):** Adalah widget yang "membungkus" atau berisi widget lain. Contohnya, sebuah `Column` adalah *parent* dari daftar widget yang ditampilkannya secara vertikal.
*   **Child Widget (Anak):** Adalah widget yang berada di dalam widget lain. Contohnya, beberapa widget `Text` bisa menjadi *children* dari sebuah `Column`.

Cara kerja hubungan ini adalah *parent widget* sering kali mengontrol bagaimana *child widget* akan ditampilkan (posisi, ukuran, dll.). Selain itu, beberapa properti seperti tema dapat diwariskan dari *parent* ke semua *children* di bawahnya.

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

Berikut adalah widget yang digunakan dalam proyek `GoalHub (football_shop)`:

*   **MaterialApp**: Membungkus seluruh aplikasi dan menyediakan fungsionalitas dasar seperti routing, tema, dan navigasi.
*   **Scaffold**: Menyediakan struktur dasar untuk halaman aplikasi, seperti `appBar` (bilah atas), `body` (konten utama), dan lainnya.
*   **AppBar**: Widget yang ditampilkan di bagian atas layar, biasanya berisi judul halaman dan beberapa aksi.
*   **Padding**: Memberikan ruang (jarak) di sekitar *child*-nya.
*   **Column**: Menyusun *children*-nya dalam urutan vertikal.
*   **Center**: Menempatkan *child*-nya di tengah-tengah area yang tersedia.
*   **Text**: Menampilkan teks atau tulisan.
*   **SizedBox**: Membuat sebuah kotak dengan ukuran tertentu, biasanya digunakan untuk memberi jarak antar widget.
*   **GridView**: Menampilkan widget dalam bentuk grid (kisi) yang dapat digulir.
*   **Material**: Memberikan properti visual dari Material Design, seperti warna latar, elevasi (bayangan), dan bentuk.
*   **InkWell**: Membuat area yang merespons sentuhan (seperti `onTap`) dan menampilkan efek riak saat ditekan.
*   **Icon**: Menampilkan sebuah ikon grafis dari set ikon yang tersedia.
*   **StatelessWidget**: Kelas dasar untuk widget yang propertinya tidak dapat berubah (immutable). Contohnya `MyHomePage` dan `ItemCard`.
*   **Theme**: Digunakan untuk mengakses properti tema global, seperti skema warna.
*   **Container**: Sebuah kotak serbaguna yang dapat diatur propertinya seperti padding, margin, color, width, dan height. Dalam proyek ini, digunakan untuk memberi padding pada ikon dan teks di dalam ItemCard.
*   **ScaffoldMessenger**: Mengelola SnackBar dan komponen pesan lainnya untuk Scaffold.
*   **SnackBar**: Widget pesan sementara yang muncul di bagian bawah layar untuk memberikan umpan balik singkat kepada pengguna.

### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

`MaterialApp` adalah widget fundamental yang membungkus seluruh aplikasi dan menyediakan banyak fitur penting yang diperlukan untuk aplikasi bergaya Material Design. Fungsinya antara lain:
*   **Routing dan Navigasi**: Mengelola tumpukan halaman (rute) dan memudahkan navigasi antar layar.
*   **Tema (Theming)**: Menyediakan `ThemeData` yang memungkinkan Anda menentukan skema warna dan gaya tipografi global untuk seluruh aplikasi.
*   **Integrasi Material Design**: Memastikan aplikasi Anda mengikuti pedoman Material Design secara keseluruhan.
*   **Dukungan Lokalisasi**: Memudahkan pengembangan aplikasi multibahasa.

`MaterialApp` sering digunakan sebagai *widget root* karena ia menyediakan semua konteks dan layanan dasar (seperti navigasi dan tema) yang dibutuhkan oleh sebagian besar widget lain di dalam aplikasi. Tanpa `MaterialApp`, widget seperti `Scaffold` dan `Navigator` tidak akan berfungsi dengan benar.

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

Perbedaan utama terletak pada pengelolaan **state** (keadaan).

*   **StatelessWidget**: Adalah widget yang *immutable* (tidak dapat berubah). Setelah dibuat, properti dan tampilannya tidak akan pernah berubah selama siklus hidupnya. Widget ini hanya digambar sekali dan tidak akan digambar ulang kecuali input eksternal berubah.
*   **StatefulWidget**: Adalah widget yang *mutable* (dapat berubah). Ia memiliki objek `State` internal yang dapat menyimpan data yang bisa berubah. Ketika data di dalam `State` berubah (biasanya dengan memanggil `setState()`), widget ini akan memberi tahu Flutter untuk membangun ulang UI-nya untuk merefleksikan perubahan tersebut.

**Kapan memilihnya:**
*   Gunakan **StatelessWidget** ketika UI yang Anda buat bersifat statis dan tidak bergantung pada interaksi pengguna atau perubahan data internal. Contoh: ikon, label teks statis, atau halaman "Tentang Kami".
*   Gunakan **StatefulWidget** ketika UI perlu diperbarui secara dinamis sebagai respons terhadap interaksi pengguna (misalnya menekan tombol), data yang masuk, atau perubahan internal lainnya. Contoh: *checkbox*, formulir input, atau halaman yang menampilkan data *real-time*.

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

`BuildContext` adalah "penanda lokasi" yang memberi tahu setiap widget di mana posisinya berada di dalam *widget tree*. Setiap widget memiliki `BuildContext`-nya sendiri, yang menjadi referensi ke lokasinya dan ke *parent*-nya.

**Pentingnya BuildContext**:
*   **Mencari Ancestor**: `BuildContext` digunakan untuk menemukan widget atau `State` leluhur (ancestor) dalam pohon. Contoh paling umum adalah `Theme.of(context)` yang mencari `Theme` terdekat ke atas, atau `Navigator.of(context)` untuk navigasi.
*   **Akses ke Layanan**: Ia menyediakan akses ke layanan yang disediakan oleh widget leluhur, seperti tema, data media query (ukuran layar), dan navigasi.

Di dalam metode `build`, `BuildContext` diterima sebagai parameter: `Widget build(BuildContext context)`. Parameter `context` inilah yang digunakan oleh *child widget* untuk berinteraksi dengan lingkungannya, misalnya mengambil skema warna dari tema (`Theme.of(context).colorScheme.primary`) atau berpindah halaman (`Navigator.push(...)`).

### 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

**Hot Reload** dan **Hot Restart** adalah fitur yang mempercepat siklus pengembangan di Flutter.

*   **Hot Reload**:
    *   **Apa yang dilakukan**: Menyuntikkan file kode sumber yang telah diperbarui ke dalam Dart Virtual Machine (VM) yang sedang berjalan. Setelah itu, Flutter akan membangun ulang *widget tree*.
    *   **Keadaan (State)**: **Tidak hilang**. State dari `StatefulWidget` tetap dipertahankan.
    *   **Kapan digunakan**: Ideal untuk perubahan UI cepat, seperti mengubah warna, tata letak, atau teks. Ini memungkinkan developer melihat perubahan secara instan tanpa harus memulai ulang dari awal.

*   **Hot Restart**:
    *   **Apa yang dilakukan**: Mereset seluruh aplikasi, menghancurkan state yang ada, dan memulai ulang aplikasi dari awal (menjalankan kembali fungsi `main()`).
    *   **Keadaan (State)**: **Hilang**. Aplikasi kembali ke keadaan awal.
    *   **Kapan digunakan**: Digunakan saat perubahan kode tidak dapat diterapkan dengan *hot reload*, seperti mengubah *global state*, menambahkan aset baru, atau mengubah logika di `initState()`. Proses ini lebih cepat daripada "full restart" (menghentikan dan menjalankan ulang aplikasi sepenuhnya) tetapi lebih lambat dari *hot reload*.

Secara singkat, *hot reload* untuk perubahan visual cepat dengan state terjaga, sedangkan *hot restart* untuk perubahan struktural yang lebih dalam yang memerlukan reset state.

---

## Tugas 8: Flutter Lanjutan

### 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Perbedaan utama antara keduanya terletak pada cara mengelola tumpukan navigasi (*navigation stack*).
*   **`Navigator.push()`**: Mendorong (menambahkan) halaman baru **di atas** tumpukan. Halaman sebelumnya tetap ada di dalam tumpukan, dan pengguna bisa kembali ke sana dengan menekan tombol "kembali" (baik fisik maupun pada `AppBar`). Ini seperti membuka tab baru di browser.
*   **`Navigator.pushReplacement()`**: Mendorong halaman baru dan **membuang** halaman saat ini dari tumpukan. Ini berarti pengguna tidak bisa kembali ke halaman sebelumnya karena halaman tersebut sudah digantikan.

**Kapan Digunakan di Aplikasi Football Shop:**
*   **Gunakan `Navigator.push()`:**
    *   Saat berpindah dari **halaman utama (`MyHomePage`) ke halaman detail produk**. Pengguna tentu ingin bisa kembali ke daftar produk setelah melihat detail satu produk.
    *   Dalam aplikasi ini, saat berpindah dari halaman utama ke halaman formulir (`ProductFormPage`) dengan menekan tombol "Create Product", `push()` lebih cocok agar pengguna bisa kembali ke halaman utama tanpa harus membuka *drawer*.
*   **Gunakan `Navigator.pushReplacement()`:**
    *   **Setelah proses login atau registrasi berhasil**. Pengguna tidak seharusnya bisa kembali ke halaman login setelah berhasil masuk.
    *   Saat berpindah antar halaman utama melalui **drawer**, seperti yang sudah diimplementasikan di `left_drawer.dart`. Penggunaan `pushReplacement()` di sini mencegah tumpukan halaman yang tidak perlu. Bayangkan jika pengguna menekan "Home" -> "Add Product" -> "Home" berulang kali menggunakan `push()`; ini akan menciptakan tumpukan halaman yang sangat dalam (`Home -> Add Product -> Home -> Add Product ...`) dan membuat tombol kembali menjadi tidak intuitif.

### 2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
*Hierarki* widget `Scaffold`, `AppBar`, dan `Drawer` adalah fondasi untuk menciptakan tata letak yang konsisten dan familiar bagi pengguna di seluruh aplikasi.
*   **`Scaffold`**: Berperan sebagai kerangka dasar untuk setiap halaman. Dengan menggunakan `Scaffold` di semua halaman utama (seperti `MyHomePage` dan `ProductFormPage`), kita memastikan bahwa setiap halaman memiliki struktur yang sama: ada tempat untuk `AppBar`, `body` (konten utama), dan `Drawer`.
*   **`AppBar`**: Ditempatkan di dalam `Scaffold` untuk menyediakan bilah atas yang konsisten. Di aplikasi ini, `AppBar` digunakan untuk menampilkan judul halaman (`title`). Ini membantu pengguna untuk selalu tahu di halaman mana mereka berada.
*   **`Drawer`**: Ditempatkan juga di dalam `Scaffold`. Karena `Drawer` (dalam kasus ini, `LeftDrawer`) adalah widget terpisah yang bisa digunakan kembali, kita bisa menambahkannya ke `Scaffold` di setiap halaman yang membutuhkannya. Ini memastikan bahwa menu navigasi utama selalu dapat diakses dengan cara yang sama (menggeser dari kiri atau menekan ikon menu), tidak peduli di halaman mana pengguna berada.
Dengan menggabungkan ketiganya, kita menciptakan "template" halaman yang konsisten: judul selalu di atas, navigasi utama selalu di kiri, dan konten spesifik halaman selalu mengisi bagian tengah (`body`).

### 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Menggunakan widget tata letak seperti `Padding`, `SingleChildScrollView`, dan `ListView` sangat penting dalam mendesain form agar rapi, mudah digunakan, dan fungsional.
*   **`Padding`**:
    *   **Kelebihan**: Memberikan ruang bernapas di sekitar elemen UI. Tanpa `Padding`, elemen form akan menempel di tepi layar dan satu sama lain, membuatnya terlihat berantakan dan sulit dibaca.
    *   **Contoh Penggunaan**: Di file `productlist_form.dart`, setiap `TextFormField` dibungkus dengan widget `Padding(padding: const EdgeInsets.all(8.0), ...)` untuk memberikan jarak dari elemen di atas dan di bawahnya, serta dari tepi layar. Ini membuat form terlihat jauh lebih bersih dan terstruktur.
*   **`SingleChildScrollView`**:
    *   **Kelebihan**: Membuat konten di dalamnya dapat digulir (*scrollable*) jika ukurannya melebihi layar. Ini krusial untuk form yang panjang atau saat keyboard virtual muncul dan menutupi sebagian layar. Tanpa ini, pengguna mungkin tidak bisa mengakses semua kolom input, yang akan menyebabkan "pixel overflow error".
    *   **Contoh Penggunaan**: Di `productlist_form.dart`, seluruh `Column` yang berisi elemen-elemen form dibungkus dengan `SingleChildScrollView`. Ini memastikan bahwa meskipun form tersebut memiliki banyak input, pengguna tetap bisa menggulir ke bawah untuk mengisi semua bagian, bahkan pada layar ponsel yang kecil.
*   **`ListView`**:
    *   **Kelebihan**: Mirip dengan `SingleChildScrollView`, tetapi lebih dioptimalkan untuk menampilkan daftar elemen yang panjang dan dinamis, karena ia hanya merender item yang terlihat di layar (*lazy loading*).
    *   **Contoh Penggunaan**: Di file `left_drawer.dart`, semua opsi menu (`ListTile`) ditempatkan di dalam `ListView`. Ini membuat daftar opsi di dalam *drawer* dapat digulir jika suatu saat nanti jumlah menunya menjadi sangat banyak hingga melebihi tinggi layar.

### 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Untuk menciptakan identitas visual yang konsisten, kita memanfaatkan sistem tema global Flutter yang disediakan oleh `MaterialApp`.  Di file `main.dart`, kita mendefinisikan `ThemeData` yang akan diwariskan ke seluruh widget di dalam aplikasi.

