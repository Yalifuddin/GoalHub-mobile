# football_shop

A new Flutter project.

## Getting Started

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

## Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements

### 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
`Navigator.push()` dan `Navigator.pushReplacement()` merupakan dua metode navigasi dengan perilaku yang berbeda dalam mengelola tumpukan halaman (*navigation stack*).
*   **`Navigator.push()`**: Metode ini menambahkan halaman baru di atas tumpukan. Halaman sebelumnya tidak hilang dan tetap ada di dalam tumpukan, sehingga pengguna dapat kembali menggunakan tombol *back*. Cara kerjanya mirip seperti membuka tab baru di browser.
*   **`Navigator.pushReplacement()`**: Metode ini mengganti halaman saat ini dengan halaman yang baru. Halaman yang lama akan dihapus dari tumpukan, sehingga pengguna tidak dapat kembali lagi ke halaman tersebut.
**Penerapan pada aplikasi Football Shop:**
*   **`Navigator.push()` sebaiknya digunakan untuk:**
    *   Navigasi dari halaman utama ke halaman formulir "Create Product". Ini memungkinkan pengguna untuk bisa kembali ke halaman utama jika membatalkan pengisian form.
    *   Navigasi ke halaman detail produk (jika ada). Pengguna bisa melihat detail sebuah produk, lalu kembali lagi ke daftar produk.
*   **`Navigator.pushReplacement()` cocok digunakan untuk:**
    *   Navigasi melalui menu pada `Drawer`. Seperti yang diimplementasikan pada `left_drawer.dart`, metode ini mencegah penumpukan halaman yang tidak perlu saat pengguna berpindah-pindah antar menu utama (misalnya dari "Home" ke "Add Product").
    *   Setelah proses *login* atau *logout*. Pengguna tidak seharusnya bisa kembali ke halaman login setelah berhasil masuk, atau kembali ke halaman utama setelah keluar.

### 2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Pemanfaatan hierarki `Scaffold`, `AppBar`, dan `Drawer` adalah kunci untuk membangun antarmuka yang konsisten dan intuitif.
*   **`Scaffold`**: Berfungsi sebagai kerangka utama untuk setiap halaman. Penggunaan `Scaffold` di berbagai halaman (seperti `MyHomePage` dan `ProductFormPage`) memastikan setiap halaman memiliki struktur visual yang sama, dengan area untuk `AppBar`, `body`, dan `Drawer`.
*   **`AppBar`**: Digunakan di dalam `Scaffold` untuk menampilkan bilah judul di bagian atas. Ini memberikan identitas pada setiap halaman dan membantu orientasi pengguna.
*   **`Drawer`**: Ditempatkan sebagai properti pada `Scaffold`. Dengan membuat `Drawer` sebagai widget yang dapat digunakan kembali (seperti `LeftDrawer`), menu navigasi utama dapat dipasang di halaman manapun dengan mudah. Ini menciptakan akses yang konsisten ke fitur-fitur utama aplikasi dari halaman manapun.
Kombinasi ketiganya menghasilkan sebuah "template" halaman yang standar: judul di atas, navigasi utama di samping (kiri), dan konten utama di tengah.

### 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Widget-widget tata letak ini sangat esensial untuk mendesain form yang fungsional dan nyaman digunakan.
*   **`Padding`**:
    *   **Kelebihan**: Memberikan ruang kosong di sekitar elemen UI, mencegah antarmuka terlihat penuh sesak dan sulit dibaca.
    *   **Contoh Penggunaan**: Di `productlist_form.dart`, setiap `TextFormField` dibungkus dengan `Padding`. Ini memberikan jarak visual yang jelas antar input field, sehingga form tampak lebih rapi dan terstruktur.
*   **`SingleChildScrollView`**:
    *   **Kelebihan**: Membuat kontennya bisa digulir (*scrollable*), yang sangat penting untuk form. Ini mencegah *overflow error* saat konten melebihi ukuran layar, terutama ketika keyboard virtual muncul.
    *   **Contoh Penggunaan**: Pada `productlist_form.dart`, seluruh `Column` yang berisi elemen form dibungkus dalam `SingleChildScrollView`. Hal ini memastikan semua field tetap dapat diakses oleh pengguna, bahkan pada perangkat dengan layar kecil.
*   **`ListView`**:
    *   **Kelebihan**: Sangat efisien untuk menampilkan daftar item yang panjang. `ListView` hanya merender item yang terlihat di layar (*lazy loading*), sehingga performa aplikasi tetap optimal.
    *   **Contoh Penggunaan**: Dalam `left_drawer.dart`, daftar opsi menu (`ListTile`) ditempatkan di dalam `ListView`. Ini membuat menu navigasi tetap dapat digulir seandainya jumlah opsinya bertambah banyak di kemudian hari.

### 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Untuk menjaga konsistensi visual, penyesuaian tema dilakukan secara terpusat melalui `ThemeData` di dalam widget `MaterialApp`. Di dalam file main.dart MaterialApp( title: 'Football Shop', theme: ThemeData( colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo), useMaterial3: true, ), home: MyHomePage(), );
**Mekanisme Penyesuaiannya:**
1.  **Definisi Warna Utama**: Dengan mendefinisikan `seedColor` (misalnya `Colors.indigo`), Flutter akan secara otomatis menghasilkan skema warna (`ColorScheme`) yang harmonis. Skema ini mencakup warna primer, sekunder, dan varian lainnya.
2.  **Pewarisan Tema**: Skema warna ini kemudian diwariskan ke seluruh widget di dalam aplikasi. Widget seperti `AppBar`, `ElevatedButton`, dan lainnya akan secara otomatis menggunakan warna dari `colorScheme` tersebut. Ini memastikan tampilan yang seragam tanpa perlu mengatur warna pada setiap widget secara manual.
3.  **Fleksibilitas Kustomisasi**: Walaupun ada tema global, tetap ada fleksibilitas untuk memberikan warna spesifik jika diperlukan. Contohnya pada halaman utama, setiap tombol aksi diberi warna unik (`blue`, `green`, `red`) untuk membedakan fungsinya secara visual.
Dengan pendekatan ini, aplikasi memiliki identitas visual yang kohesif dan mudah dikelola, namun tetap memungkinkan kustomisasi pada level komponen.
