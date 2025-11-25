# Tugas 8 Praktikum Mobile Pertemuan 10
- Nama   : Nisa Izzatul Ummah
- NIM    : H1D023034
- Shift  : D

# Hasil Screenshot
<img width="200" height="400" alt="localhost_59371_(iPhone SE)" src="https://github.com/user-attachments/assets/8b4733ae-3993-4600-9210-e7d880515b13" />
<img width="200" height="400" alt="localhost_59371_(iPhone SE) (1)" src="https://github.com/user-attachments/assets/8f6e8783-b988-4466-b130-84f5547737b7" />
<img width="200" height="400" alt="localhost_63811_(iPhone SE)" src="https://github.com/user-attachments/assets/037a1a4c-64d9-4661-bc6b-ebee0d7f6039" />
<img width="200" height="400" alt="localhost_63811_(iPhone SE) (1)" src="https://github.com/user-attachments/assets/66339c14-65ba-460f-a743-7ed6485de431" />
<img width="200" height="400" alt="localhost_63811_(iPhone SE) (2)" src="https://github.com/user-attachments/assets/b1a0e245-5a5b-424a-b655-0ad084755cbb" />
<img width="200" height="400" alt="localhost_63811_(iPhone SE) (3)" src="https://github.com/user-attachments/assets/b63495d5-189b-4a63-9396-2eef204e9df5" />


# Penjelasn Source Code
## Alur Umum
Aplikasi Flutter ini merupakan Sistem dengan arsitektur lengkap yang mencakup:
- Authentication System (Login/Register)
- Data Input Form untuk data mahasiswa
- Data Display dengan perhitungan otomatis
- Profile Management
- Navigation System dengan side menu
- Local Storage menggunakan SharedPreferences.

## 1. Autentikasi dan Inisialisasi
#### main.dart - Entry Point Aplikasi

<pre> void main() {
  runApp(const MyApp());
} </pre>

File ini merupakan titik awal aplikasi yang menginisialisasi MaterialApp dengan konfigurasi:
- initialRoute: '/' → LoginPage sebagai halaman pertama
- routes: AppRoutes.routes → Mendefinisikan semua navigasi
- theme → Menggunakan warna biru dengan font Poppins
  
#### Login System (login_page.dart)
Proses autentikasi menggunakan kredensial default:
- Username: admin
- Password: admin

Flow Login:
- User input username & password
- Validasi form (field tidak boleh kosong)
- Simulasi proses dengan delay 1.5 detik
- Cek credentials → jika valid simpan ke SharedPreferences
- Navigasi ke HomePage jika sukses

#### Registration System (register_page.dart)
Form pendaftaran dengan validasi komprehensif:
- 5 field required: Nama, Email, NIM, Password, Konfirmasi Password
- Validasi: password minimal 6 karakter, konfirmasi harus sama
- Auto-login setelah registrasi berhasil

Flow Login:
- User input username & password
- Validasi form (field tidak boleh kosong)
- Simulasi proses dengan delay 1.5 detik
- Cek credentials → jika valid simpan ke SharedPreferences
- Navigasi ke HomePage jika sukses

## 2. Dashboard dan Navigasi
#### Home Page (home_page.dart)
Dashboard utama setelah login berisi:
- Welcome Section: Menampilkan data user dari SharedPreferences
- Features Grid: 3 card navigasi (Form Data, Profile, About)
- Side Menu: Navigasi drawer dengan data user dinamis

#### Navigation System (routes.dart & sidebarmenu.dart)
Routes Terdefinisi::

<pre> {
  '/': LoginPage(),
  '/home': HomePage(),
  '/about': AboutPage(),
  '/register': RegisterPage(),
  '/form': FormData(),
  '/profile': ProfilePage(),
} </pre>

Side Menu Features:
- Header dengan data user real-time dari SharedPreferences
- Menu items dengan navigasi menggunakan Navigator.pushNamed()
- Logout functionality dengan confirmation dialog

## 3. Data Management System
#### Form Input Data (form_data.dart)
Form untuk input data mahasiswa dengan 3 field:
- Nama Lengkap → Required field
- NIM → Required + minimal 8 karakter
- Tahun Lahir → Dropdown 30 tahun terakhir (required)
  
Teknikal Implementation:
- GlobalKey<FormState> untuk form validation
- TextEditingController untuk manage input text
- DropdownButtonFormField untuk pilihan tahun
- Validasi di-trigger pada tombol submit

Data Passing ke TampilData

<pre> Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => TampilData(
      nama: _namaController.text,
      nim: _nimController.text,
      tahunLahir: _selectedTahun!,
    ),
  ),
); </pre>

Data dikirim via constructor parameters saat navigasi.

## 4. Data Processing dan Display
#### TampilData (tampil_data.dart)
Menerima dan memproses data dari form, data yang ditampilkan adalah:
- Nama Lengkap (dari parameter)
- NIM (dari parameter)
- Tahun Lahir (dari parameter)
- Umur (dihitung otomatis)
  
Automatic Age Calculation:

<pre> Automatic Age Calculation: </pre>

UI Components:
- Success header dengan icon check
- Data cards terorganisir
- Status verification message
- Tombol kembali ke form

Navigation Kembali:

<pre> Navigator.of(context).pop(); </pre>

Menutup halaman TampilData dan kembali ke FormData.

## 5. Profile dan About Sections
#### Profile Page (profile_page.dart)
Menampilkan data user dari SharedPreferences:
- Load data di initState() menggunakan _loadUserData()
- Tampilkan dalam format ListTile dengan icons
- Logout functionality dengan confirmation dialog

#### About Page (about_page.dart)
Informasi fitur aplikasi dalam format card::
- Authentication system
- Navigation features
- Data form capabilities
- Responsive design principles

## 6. Data Persistence System
#### SharedPreferences Implementation
Digunakan untuk menyimpan::
- isLoggedIn → status login user
- username → nama user
- email → email user
- nim → NIM user

Data Flow:
- Login/Register → simpan data ke SharedPreferences
- Home/Profile → load data dari SharedPreferences
- Logout → hapus data dari SharedPreferences

## Kesimpulan
Aplikasi ini mengimplementasikan:
1. State Management:
   - Local state dengan setState()
   - Data persistence dengan SharedPreferences
     Form state dengan GlobalKey<FormState>
2. Navigation Pattern:
   - Route-based navigation dengan Navigator
   - Parameter passing via constructors
   - Stack management dengan push/pop
3. Data Flow:
   - Input → Validation → Processing → Display
   - Local storage untuk user session
   - Real-time data updates
4. UI/UX Principles:
   - Consistent design language
   - Responsive layouts
   - User feedback mechanisms
   - Loading states and error handling
