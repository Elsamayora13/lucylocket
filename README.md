1.Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree adalah representasi logis (struktur) dari seluruh widget yang membentuk tampilan (UI) aplikasi flutter. Elemen seperti AppBar, Text, Row merupakan sebuah widget, flutter menyusun semua widget ini dalam bentuk widget tree(hierarki bertingkat). Struktur widget tree mirip dengan struktur sebuah pohon, di mana terdapat satu elemen utama yang disebut root widget, yaitu titik awal atau induk dari seluruh widget lain dalam aplikasi. Dari root widget ini, muncul berbagai child widget yang menjadi turunannya. Setiap child widget dapat pula memiliki child lain di bawahnya, membentuk struktur bertingkat yang menyerupai cabang dan daun pada pohon, hubungan ini disebut sebagai hubungan parent-child(induk-anak). Widget yang menjadi parent berfungsi untuk menampung, mengatur posisi, ukuran, serta tata letak dari widget anak di dalamnya. Sementara itu, widget child akan mengikuti aturan yang ditentukan oleh parent-nya dan menampilkan isi atau fungsi tertentu.

2.Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
1. MaterialApp, fungsinya sebagai root dari aplikasi flutter berbasis material design serta mengatur tema, judul, dan halaman utama.
2.Scaffold, fungsinya sebagai kerangka halaman utama pada MyHomePage (appBar,body).
3.AppBar, fungsinya untuk menampilkan judul Lucy Locket dengan warna sesuai tema.
4. Text, fungsinya menampikan text yang sifatnya statis, diunakkan untuk judul, label pada InfoCard, dan teks dalam ItemCard.
5. Padding, fungsinya untuk memberi jarak antar widget agar lebih rapi
6. Column, fungsinya untuk mengatur layout utama dalam body dan pada bagian tengah halaman (menyusun widget secara vertikal)
7. Row, fungsinya untuk menyusun widget secara horizontal, sehingga dapat menmpilkan tiga InfoCard sejajar (NPM, Name, Class).
8. SizedBox, fungsinya untuk memberikan jarak vertikal sebesar 16 piksel antara deretan tiga kartu InfoCard (NPM, Name, Class) dan teks sambutan “Selamat datang di Lucy Locket” di bawahnya.
9. GridView.count, fungsinya untuk menampilkan daftar menu (ItemCard) dalam 3 kolom. Propertinya, crossAxisCount: jumlah kolom (3), crossAxisSpacing, mainAxisSpacing: jarak antar item, shrinkWrap: agar grid menyesuaikan tinggi kontennya
10. Card, fungsinya untuk menampilkan informasi identitas (InfoCard) dan memiliki bayangan(elevation)
11. Container, funsinya untuk ukuran dan padding pada InfoCard dan ItemCard.
12. Icon, fungsinya untuk menampilkan ikon pada setiap menu (list_alt, inventory, add), ikon tersebut dari library Material Design.
13. Material, fungsinya untuk memberikan efek visual Material Design seperti ripple dan elevasi. Material membungkus InkWell agar efek sentuh terlihat sesuai tema Material.
14. InkWell, fungsinya untuk menangani interaksi klik pada setiap ItemCard yaitu akan muncul ripple di pada ItemCard dan memnuculkan pesan.
15.SnackBar, fungsinya untuk memberi pesan ketika pengguna menekan item pada grid.
16. ScaffoldMessenger, fungsinya untuk menampilkan pesan SnackBar ke tampilan.
17. Center, fungsinya untuk memusatkan teks sambutan dan grid item di tengah halaman.
18. MyApp, fungsinya sebagai kelas utama aplikasi (StatelessWidget) yang mengatur tema dan halaman utama.
19. MyHomePage, fungsinya sebagai halaman utama aplikasi (StatelessWidget) yang menampilkan identitas dan menu.
20. ItemHomepage, fungsinya sebagai model data sederhana untuk menyimpan nama dan ikon dari menu.
21. ItemCard, fungsinya sebagai widget kustom untuk menampilkan setiap item dari menu dalam bentuk kartu berwarna dan interaktif.

<<<<<<< HEAD

3.Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
widget MaterialApp berfungsi sebagai wadah utama ayangn membungkus seluruh aplikasi flutter. MaterialApp menyediakan berbagai pengaturan penting yang bersifat global, seperti judul aplikasi (title), tema tampilan (theme), serta halaman utama (home) yang pertama kali ditampilkan saat aplikasi dijalankan. MaterialApp sering digunakan sebagai widget root karena menjadi fondasi utama bagi semua widget di bawahnya. Dengan menempatkannya di posisi paling atas, seluruh widget dalam aplikasi bisa mengakses fitur-fitur Material Design seperti Scaffold, AppBar, FloatingActionButton, dan SnackBar. Selain itu, MaterialApp juga mempermudah pengaturan navigasi antarhalaman serta penerapan tema secara konsisten di seluruh bagian aplikasi.

4.Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Perbedaan antara StatelessWidget dan StatefulWidget terletak pada kemampuan dalam menangani perubahan data atau keadaan (state). StatelessWidget digunakan untuk tampilan yang bersifat statis, di mana isi dan tampilannya tidak berubah selama aplikasi berjalan. Contohnya seperti teks, ikon, atau tombol yang hanya menampilkan informasi tanpa interaksi yang memengaruhi tampilannya. Sementara itu, StatefulWidget digunakan untuk tampilan yang bersifat dinamis dan dapat berubah seiring waktu. Widget ini memiliki state yang bisa diperbarui, sehingga tampilannya dapat berubah ketika terjadi interaksi pengguna atau pembaruan data, seperti saat menekan tombol, mengisi formulir, atau mengambil data dari internet. StatelessWidget dipilih ketika tampilan tidak membutuhkan pembaruan, sedangkan StatefulWidget digunakan ketika diperlukan perubahan tampilan berdasarkan kondisi atau input tertentu.

5.Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang menunjukkan posisi suatu widget di dalam struktur widget tree di Flutter. Objek ini penting karena memungkinkan widget berinteraksi dengan widget lain di atasnya, seperti mengakses tema, ukuran layar, atau melakukan navigasi. Dalam metode build, BuildContext digunakan untuk membangun tampilan yang sesuai dengan konteksnya. Misalnya, melalui Theme.of(context) widget dapat mengambil gaya tampilan dari tema aplikasi. Dengan kata lain, BuildContext membantu widget membangun UI yang tepat berdasarkan lingkungan tempatnya berada.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot reload adalah fitur di flutter yang memungkinkan untuk melihat perubahan kode secara langsung tanpa perlu menghentikan aplikasi yang sedang berjalan. Saat hot reload dijalankan, flutter hanya memperbarui bagian kode yang diubah dan mempertahankan state (keadaan) aplikasi, seperti nilai variabel atau posisi halaman. Hal ini membuat proses pengembangan lebih cepat karena tidak perlu memulai ulang aplikasi dari awal. Sementara itu, hot restart juga memuat ulang aplikasi, tetapi dengan cara mengulang seluruh proses dari awal. Semua state yang tersimpan akan hilang, dan aplikasi akan kembali ke kondisi awal seperti saat pertama kali dijalankan. Jadi, perbedaan utamanya adalah hot reload mempertahankan state aplikasi, sedangkan hot restart menghapus state dan memulai ulang seluruh aplikasi.
=======
3.Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
widget MaterialApp berfungsi sebagai wadah utama ayangn membungkus seluruh aplikasi flutter. MaterialApp menyediakan berbagai pengaturan penting yang bersifat global, seperti judul aplikasi (title), tema tampilan (theme), serta halaman utama (home) yang pertama kali ditampilkan saat aplikasi dijalankan. MaterialApp sering digunakan sebagai widget root karena menjadi fondasi utama bagi semua widget di bawahnya. Dengan menempatkannya di posisi paling atas, seluruh widget dalam aplikasi bisa mengakses fitur-fitur Material Design seperti Scaffold, AppBar, FloatingActionButton, dan SnackBar. Selain itu, MaterialApp juga mempermudah pengaturan navigasi antarhalaman serta penerapan tema secara konsisten di seluruh bagian aplikasi.

4.Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Perbedaan antara StatelessWidget dan StatefulWidget terletak pada kemampuan dalam menangani perubahan data atau keadaan (state). StatelessWidget digunakan untuk tampilan yang bersifat statis, di mana isi dan tampilannya tidak berubah selama aplikasi berjalan. Contohnya seperti teks, ikon, atau tombol yang hanya menampilkan informasi tanpa interaksi yang memengaruhi tampilannya. Sementara itu, StatefulWidget digunakan untuk tampilan yang bersifat dinamis dan dapat berubah seiring waktu. Widget ini memiliki state yang bisa diperbarui, sehingga tampilannya dapat berubah ketika terjadi interaksi pengguna atau pembaruan data, seperti saat menekan tombol, mengisi formulir, atau mengambil data dari internet. StatelessWidget dipilih ketika tampilan tidak membutuhkan pembaruan, sedangkan StatefulWidget digunakan ketika diperlukan perubahan tampilan berdasarkan kondisi atau input tertentu.

5.Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang menunjukkan posisi suatu widget di dalam struktur widget tree di Flutter. Objek ini penting karena memungkinkan widget berinteraksi dengan widget lain di atasnya, seperti mengakses tema, ukuran layar, atau melakukan navigasi. Dalam metode build, BuildContext digunakan untuk membangun tampilan yang sesuai dengan konteksnya. Misalnya, melalui Theme.of(context) widget dapat mengambil gaya tampilan dari tema aplikasi. Dengan kata lain, BuildContext membantu widget membangun UI yang tepat berdasarkan lingkungan tempatnya berada.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot reload adalah fitur di flutter yang memungkinkan untuk melihat perubahan kode secara langsung tanpa perlu menghentikan aplikasi yang sedang berjalan. Saat hot reload dijalankan, flutter hanya memperbarui bagian kode yang diubah dan mempertahankan state (keadaan) aplikasi, seperti nilai variabel atau posisi halaman. Hal ini membuat proses pengembangan lebih cepat karena tidak perlu memulai ulang aplikasi dari awal. Sementara itu, hot restart juga memuat ulang aplikasi, tetapi dengan cara mengulang seluruh proses dari awal. Semua state yang tersimpan akan hilang, dan aplikasi akan kembali ke kondisi awal seperti saat pertama kali dijalankan. Jadi, perbedaan utamanya adalah hot reload mempertahankan state aplikasi, sedangkan hot restart menghapus state dan memulai ulang seluruh aplikasi.

Tugas 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Perbedaan antara antara Navigator.push() dan Navigator.pushReplacement() adalah Navigator.push() menambah page baru di atas stack navigasi, page sebelumnya tetap ada di dalam stack dan user masih bisa untuk kembali ke page sebelumnya, bisanya dengan tombol back, sedangkan Navigator.pushReplacement() mengganti page saat ini denegan page baru, user tidak bisa kembali ke page sebelumnya dengan tombol back. Navigator.push() sebaiknya digunakan ketika user melakukan navigasi dari tombol atau card di halaman utama menuju halaman form, misalnya user mengklik tombol Create Product di homepage, user akan diarahkan ke halaman form untuk menambahakan produk baru, push() memungkinkan user untuk kembali ke page sebelumnya. Untuk pushReplacement() dapat digunakan untuk navigasi melalui drawer, ketika user membuka drawer  dan memilih menu Halaman Utama atau Tambah Produk. Drawer berfungsi sebagai navigasi utama antarhalaman dalam aplikasi, bukan sebagai navigasi sementara. 

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi? 
Pemanfaatannya, yang pertama untuk Scaffold sebagai widget dasar yang saya gunakan di setiap halaman aplikasi, baik di halaman Home maupun halaman Form. Scaffold ini berfungsi sebagai kerangka atau template yang provide struktur layout Material Design standar. Di dalamnya, saya bisa menempatkan komponen-komponen penting seperti AppBar di bagian atas, Drawer di samping kiri, dan Body di bagian tengah. Dengan menggunakan Scaffold di semua halaman, saya memastikan bahwa setiap halaman memiliki struktur dasar yang sama. Misalnya, di menu.dart saya menulis Scaffold(appBar: ..., drawer: ..., body: ...), dan struktur yang persis sama juga saya terapkan di productentry_form.dart. Hal ini membuat kode lebih terorganisir karena setiap halaman mengikuti pola yang seragam, sehingga menjadi lebih konsisten. Selanjutnya, AppBar saya manfaatkan sebagai header yang konsisten di setiap halaman untuk memberikan identitas aplikasi dan konteks halaman saat ini. Di halaman utama, AppBar menampilkan judul "Lucy Locket" dengan font tebal dan warna putih, menggunakan warna background dari theme primary color. Di halaman form, AppBar tetap menggunakan style yang sama dengan background warna yang sama, hanya judulnya yang berubah menjadi "Form Tambah Produk" untuk memberi tahu user bahwa mereka sedang berada di halaman form. Terakhir yaitu Drawer, saya membuah satu dile terpisah left_drawer.dart yang isinya widget LeftDrawer, kemudian widget ini saya gunakan untuk semua halaman yang membutuhkan navigasi. Isi dari left_drawer yaitu header dengan judul "Lucy Locket" dan tagline "Kelola produk toko kamu di sini!", kemudian dua ListTile untuk menu "Halaman Utama" dan "Tambah Produk". Dengan membuat drawer sebagai widget terpisah, saya hanya perlu menulis kode drawer sekali, lalu tinggal memanggil drawer: const LeftDrawer() di setiap Scaffold. 

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Padding adalah widget untuk memeberikan jarak di sekitar elemen-elemen form. Kelebihannya padding memebuat tampilan tidak terlihat sempit atau rapat antarelemen atau memberikan space untuk setiap elemen.
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Nama Produk",
      labelText: "Nama Produk",
      ...
    ),
  ),
)
Pada kode tersebut, Padding membuat TextFormField akan mempunya jarak satu sama lain, dengan Padding 8 pixel di semua sisi, setiap input field memiliki jarak yang cukup sehingga user bisa dengan mudah fokus pada satu field tanpa terganggu field lain. Selanjutnya, SingleChildScrollView adalah widget untuk form karena memungkinkan konten yang panjang bisa discroll secara vertikal. Kelebihan utamanya adalah mencegah overflow error ketika konten lebih panjang dari tinggi layar.  Di aplikasi Lucy Locket, form tambah produk memiliki 6 input field (nama, harga, deskripsi, kategori, thumbnail, dan switch featured), ditambah tombol save. Jika semua ini dipaksakan muat dalam satu layar tanpa scroll, pada device dengan layar kecil akan terjadi error "RenderFlex overflowed" dan beberapa element akan terpotong atau tidak terlihat. Dengan membungkus Column form dalam SingleChildScrollView:
body: Form(
  key: _formKey,
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // kodee...
      ],
    ),
  ),
)
User bisa dengan leluasa scroll ke bawah untuk mengisi semua field. SingleChildScrollView juaga smooth dan responsif, mengikuti gestur scroll user dengan natural. Selanjutnya, ListView saya gunakan di dalam Drawer untuk menampilkan menu-menu navigasi. Meskipun saat ini hanya ada DrawerHeader dan dua ListTile, penggunaan ListView memberikan fleksibilitas untuk menambah menu lebih banyak di masa depan tanpa khawatir overflow. Kelebihan ListView dibanding Column biasa adalah ListView secara otomatis scrollable dan lebih efisien untuk data yang banyak:
return Drawer(
  child: ListView(
    children: [
      const DrawerHeader(...),
      ListTile(...), // Halaman Utama
      ListTile(...), // Tambah Produk
      ....
    ],
  ),
)
 ListView juga memiliki performa yang lebih baik untuk list yang panjang karena menggunakan lazy loading - hanya render item yang terlihat di layar. Kombinasi ketiga widget ini menciptakan form yang truly responsive dan accessible. 


4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Saya mendefinisikan tema aplikasi di main.dart sebagai single source of truth untuk semua warna. Menggunakan ColorScheme.fromSwatch() dengan primarySwatch: Colors.blue, saya membuat palet warna biru sebagai warna utama aplikasi:
theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.blueAccent[400]),
)
Primary lor daya apalikasikan di komponen yang paling mencolok dan selalu terlihat  yaitu di AppBar. Dengan menggunakan Theme.of(context).colorScheme.primary instead of hardcoding Colors.blue apabila saya ingin menggunakan warna hijau atau merah, saya cukup ubah satu baris di main.dart dan semua AppBar akan otomatis berubah. Kemudian, secondary color (blue accent) saya gunakan untuk elemen-elemen interaktif seperti card dan button. Di halaman home, setiap ItemCard yang tidak punya warna spesifik akan menggunakan secondary color sebagai fallback:
color: Theme.of(context).colorScheme.secondary,
Untuk button Save di form, saya menggunakan primary color agar konsisten dengan AppBar:
ElevatedButton(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(
      Theme.of(context).colorScheme.primary,
    ),
  ),
  child: const Text("Save", 
    style: TextStyle(color: Colors.white),
  ),
)
Meskipun menggunakan theme sebagai base, saya juga memberikan customisasi warna untuk item-item spesifik yang perlu dibedakan. Di halaman home, setiap tombol memiliki warna yang berbeda untuk memudahkan user mengenali fungsinya:
if (item.name == "All Products") {
  backgroundColor = Colors.blue;
} else if (item.name == "My Products") {
  backgroundColor = Colors.green;
} else if (item.name == "Create Product") {
  backgroundColor = Colors.red;
}

Tugas 9
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Pembuatan model Dart diperlukan untuk memberikan type safety dan null safety yang lebih baik. Dengan model, data yang diterima dari JSON akan divalidasi tipe datanya, menghindari runtime error yang mungkin terjadi jika langsung menggunakan Map<String, dynamic>. Model juga meningkatkan maintainability kode karena struktur data terdefinisi dengan jelas, memudahkan refactoring dan pengembangan fitur baru. Tanpa model, rentan terhadap error seperti typo pada key map atau tipe data yang tidak sesuai.

2.Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
Package http bertugas untuk melakukan HTTP requests biasa ke server Django, sedangkan CookieRequest mengelola cookies untuk autentikasi. Perbedaan utamanya adalah http hanya menangani request-response biasa, sementara CookieRequest secara otomatis menangani session cookies untuk menjaga state login pengguna across requests. CookieRequest memastikan setiap request ke Django membawa cookie authentication yang diperlukan.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Instance CookieRequest perlu dibagikan ke semua komponen karena menggunakan provider pattern untuk state management yang konsisten. Dengan membagikan instance yang sama, seluruh aplikasi dapat mengakses status autentikasi yang terpusat, memudahkan sinkronisasi state login across seluruh widget dan memastikan UI konsisten menampilkan status login.

4.Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar? Konfigurasi konektivitas diperlukan karena Flutter berjalan di environment yang berbeda. 10.0.2.2 ditambahkan ke ALLOWED_HOSTS karena emulator Android menggunakan IP ini untuk mengakses localhost development server. CORS diaktifkan untuk mengizinkan cross-origin requests dari aplikasi Flutter. SameSite/cookie diatur agar cookies dapat dikirim cross-site. Izin internet di Android diperlukan karena aplikasi melakukan network requests. Tanpa konfigurasi ini, komunikasi antara Flutter dan Django akan gagal total.

5.Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter. Mekanisme pengiriman data dimulai dari input user di Flutter, data dikonversi ke JSON, dikirim via HTTP POST/PUT request ke endpoint Django. Django memproses data, menyimpan ke database, dan mengembalikan response. Flutter menerima response JSON, mem-parsing ke model Dart, dan menampilkan di UI melalui setState atau provider.

6.Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter. Mekanisme autentikasi dimulai dari halaman register/login di Flutter mengirim credentials ke endpoint Django. Django melakukan validasi, membuat user session, dan mengembalikan authentication cookie. CookieRequest menyimpan cookie ini dan melampirkannya di setiap subsequent request. Status login di-maintain secara global, mengupdate UI untuk menampilkan menu yang sesuai. Logout dilakukan dengan mengirim request ke logout endpoint dan menghapus stored cookies.

7.Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial). Pertama, memastikan deployment Django berjalan dengan baik dan endpoints berfungsi. Kemudian mengimplementasi fitur registrasi dan login di Flutter dengan form validation. Selanjutnya mengintegrasikan autentikasi menggunakan CookieRequest dan provider untuk state management. Membuat model Dart yang sesuai dengan struktur data Django. Implementasi halaman daftar item dengan FutureBuilder untuk fetch data dari JSON endpoint. Membuat halaman detail dengan navigator dan passing data arguments. Terakhir, implementasi filtering berdasarkan user yang login dengan menambahkan query parameter atau header authentication di requests.

>>>>>>> b41028f (Add ReadMe)
