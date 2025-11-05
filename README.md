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


3.Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
widget MaterialApp berfungsi sebagai wadah utama ayangn membungkus seluruh aplikasi flutter. MaterialApp menyediakan berbagai pengaturan penting yang bersifat global, seperti judul aplikasi (title), tema tampilan (theme), serta halaman utama (home) yang pertama kali ditampilkan saat aplikasi dijalankan. MaterialApp sering digunakan sebagai widget root karena menjadi fondasi utama bagi semua widget di bawahnya. Dengan menempatkannya di posisi paling atas, seluruh widget dalam aplikasi bisa mengakses fitur-fitur Material Design seperti Scaffold, AppBar, FloatingActionButton, dan SnackBar. Selain itu, MaterialApp juga mempermudah pengaturan navigasi antarhalaman serta penerapan tema secara konsisten di seluruh bagian aplikasi.

4.Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Perbedaan antara StatelessWidget dan StatefulWidget terletak pada kemampuan dalam menangani perubahan data atau keadaan (state). StatelessWidget digunakan untuk tampilan yang bersifat statis, di mana isi dan tampilannya tidak berubah selama aplikasi berjalan. Contohnya seperti teks, ikon, atau tombol yang hanya menampilkan informasi tanpa interaksi yang memengaruhi tampilannya. Sementara itu, StatefulWidget digunakan untuk tampilan yang bersifat dinamis dan dapat berubah seiring waktu. Widget ini memiliki state yang bisa diperbarui, sehingga tampilannya dapat berubah ketika terjadi interaksi pengguna atau pembaruan data, seperti saat menekan tombol, mengisi formulir, atau mengambil data dari internet. StatelessWidget dipilih ketika tampilan tidak membutuhkan pembaruan, sedangkan StatefulWidget digunakan ketika diperlukan perubahan tampilan berdasarkan kondisi atau input tertentu.

5.Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang menunjukkan posisi suatu widget di dalam struktur widget tree di Flutter. Objek ini penting karena memungkinkan widget berinteraksi dengan widget lain di atasnya, seperti mengakses tema, ukuran layar, atau melakukan navigasi. Dalam metode build, BuildContext digunakan untuk membangun tampilan yang sesuai dengan konteksnya. Misalnya, melalui Theme.of(context) widget dapat mengambil gaya tampilan dari tema aplikasi. Dengan kata lain, BuildContext membantu widget membangun UI yang tepat berdasarkan lingkungan tempatnya berada.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot reload adalah fitur di flutter yang memungkinkan untuk melihat perubahan kode secara langsung tanpa perlu menghentikan aplikasi yang sedang berjalan. Saat hot reload dijalankan, flutter hanya memperbarui bagian kode yang diubah dan mempertahankan state (keadaan) aplikasi, seperti nilai variabel atau posisi halaman. Hal ini membuat proses pengembangan lebih cepat karena tidak perlu memulai ulang aplikasi dari awal. Sementara itu, hot restart juga memuat ulang aplikasi, tetapi dengan cara mengulang seluruh proses dari awal. Semua state yang tersimpan akan hilang, dan aplikasi akan kembali ke kondisi awal seperti saat pertama kali dijalankan. Jadi, perbedaan utamanya adalah hot reload mempertahankan state aplikasi, sedangkan hot restart menghapus state dan memulai ulang seluruh aplikasi.
