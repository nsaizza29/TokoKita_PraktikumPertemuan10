# Tugas 8 Praktikum Mobile Pertemuan 10
- Nama   : Nisa Izzatul Ummah
- NIM    : H1D023034
- Shift  : D

# Hasil Screenshot
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (1)" src="https://github.com/user-attachments/assets/343b1baa-2b7a-473e-bdb9-c9e1336e3493" />
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (8)" src="https://github.com/user-attachments/assets/faf4251c-62f8-45ea-9368-80057f9e8fd4" />
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (2)" src="https://github.com/user-attachments/assets/1ead2aba-0931-4e57-a6de-661f0137e910" />
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (11)" src="https://github.com/user-attachments/assets/24dd9e10-9fdf-409c-9732-29f0a9831b24" />
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (12)" src="https://github.com/user-attachments/assets/1f5f9e63-4be0-4e60-a7cd-6ba527fe15bd" />
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (13)" src="https://github.com/user-attachments/assets/a573b9a3-5200-4eaf-b2ee-b312dd89cc38" />
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (14)" src="https://github.com/user-attachments/assets/8a99fecd-2ce3-4d71-b573-cb358c120b06" />
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (7)" src="https://github.com/user-attachments/assets/61f8aa94-5973-4420-ba4b-485db85a7c1f" />


# Penjelasn Source Code
## 1. registrasi.dart (Model Data Registrasi)
File ini merupakan model data yang berfungsi sebagai template untuk menyimpan respons dari proses registrasi. Class Registrasi memiliki tiga properti utama: code untuk menyimpan kode status HTTP dari server, status sebagai boolean yang menandai berhasil atau gagalnya registrasi, dan data untuk menyimpan pesan atau informasi tambahan dari server. Factory method fromJson digunakan untuk mengonversi data JSON yang diterima dari server menjadi objek Dart yang siap diproses di aplikasi.

## 2. login_page.dart (Halaman Login)
Halaman login berfungsi sebagai pintu masuk utama aplikasi dengan form autentikasi yang terdiri dari input email dan password. Menggunakan StatefulWidget untuk mengelola state form, dengan TextEditingController untuk membaca input pengguna dan GlobalKey untuk validasi form. Fitur loading indicator ditampilkan selama proses simulasi login, dan terdapat navigasi ke halaman registrasi melalui InkWell. Validasi memastikan kedua field tidak boleh kosong sebelum proses login dijalankan.

## 3. produk_detail.dart (Halaman Detail Produk)
Halaman ini menampilkan detail lengkap produk termasuk kode, nama, dan harga produk. Pengguna dapat melakukan dua aksi utama: edit data melalui tombol EDIT yang mengarah ke halaman form, atau hapus data melalui tombol DELETE yang memunculkan dialog konfirmasi. Dialog hapus menggunakan AlertDialog dengan dua pilihan Ya dan Batal, dimana pilihan Ya akan menjalankan proses penghapusan dan mengembalikan pengguna ke halaman daftar produk. Terdapat juga proteksi terhadap data null untuk mencegah error.

## 4. produk_form.dart (Halaman Form Produk)
Halaman form produk memiliki fungsi ganda untuk menambah data baru dan mengedit data existing. Mode operasi ditentukan oleh ada tidaknya data produk yang dikirimkan - jika null berarti mode tambah, jika berisi data berarti mode edit. Form terdiri dari tiga input field: kode produk, nama produk, dan harga produk dengan validasi masing-masing. Pada mode edit, field akan terisi otomatis dengan data existing melalui TextEditingController. Proses simpan/update disimulasikan dengan delay dan menampilkan feedback melalui SnackBar.

## 5. main.dart (File Utama Aplikasi)
File main.dart merupakan titik awal eksekusi aplikasi Flutter. Di dalamnya terdapat class MyApp yang extends StatelessWidget dan mengembalikan MaterialApp sebagai root widget. Aplikasi dikonfigurasi dengan title "Toko Kita" dan menampilkan ProdukPage sebagai halaman awal. Meskipun terdapat class MyHomePage dengan counter, class tersebut tidak digunakan dalam alur aplikasi sesungguhnya dan berfungsi sebagai template default Flutter.

## 6. produk.dart (Model Data Produk)
Model Produk berfungsi sebagai blueprint untuk menyimpan data produk dengan empat properti utama: id, kodeProduk, namaProduk, dan hargaProduk. Semua properti menggunakan nullable type untuk mengantisipasi data yang mungkin tidak tersedia. Factory method fromJson bertugas mengonversi data JSON dari API server menjadi objek Produk yang siap digunakan di aplikasi, dengan mapping key JSON ke properti yang sesuai.

## 7. registrasi_page.dart (Halaman Registrasi)
Halaman registrasi menyediakan form pendaftaran pengguna baru dengan empat field input: nama, email, password, dan konfirmasi password. Setiap field memiliki validasi spesifik - nama minimal 3 karakter, email harus format valid menggunakan regex pattern, password minimal 6 karakter, dan konfirmasi password harus sama dengan password. Proses registrasi disimulasikan dengan delay dan menampilkan loading indicator selama proses berlangsung, kemudian memberikan feedback sukses melalui SnackBar.

## 8. login.dart (Model Data Login)
Model Login dirancang untuk menangani dua skenario respons login: sukses dan gagal. Pada login sukses (code 200), model akan menyimpan token akses, userID, dan userEmail dari respons server. Sedangkan pada login gagal, hanya code dan status yang disimpan. Factory method fromJson menggunakan conditional logic untuk menentukan struktur data yang akan diambil berdasarkan kode respons, dengan konversi tipe data untuk userID dari string ke integer.

## 9. produk_page.dart (Halaman Daftar Produk)
Halaman utama aplikasi yang menampilkan daftar produk dalam bentuk ListView dinamis menggunakan ListView.builder. Data produk disimpan dalam list _produkList yang berisi data dummy. AppBar dilengkapi dengan tombol tambah (+) untuk navigasi ke halaman form, dan drawer menu dengan opsi logout. Setiap item produk ditampilkan menggunakan widget terpisah ItemProduk yang wrapped dengan GestureDetector untuk menangani klik dan navigasi ke halaman detail produk.
