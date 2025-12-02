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
## 1. PROSES LOGIN
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (8)" src="https://github.com/user-attachments/assets/faf4251c-62f8-45ea-9368-80057f9e8fd4" />
User membuka aplikasi → Sistem cek token di SharedPreferences
Jika belum login → Diarahkan ke halaman Login
Mengisi form:
- Email (harus valid format email)
- Password (minimal 6 karakter)
Tombol Login ditekan → Validasi form
Jika valid → API call ke /login
Jika berhasil (code 200):
- Token JWT disimpan di SharedPreferences
- UserID disimpan
- Redirect ke halaman Produk
Jika gagal → Tampilkan dialog error.

## 2. PROSES REGISTRASI
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (1)" src="https://github.com/user-attachments/assets/343b1baa-2b7a-473e-bdb9-c9e1336e3493" />

Dari halaman login → Klik "Registrasi"
Mengisi form:
- Nama (minimal 3 karakter)
- Email (format valid)
- Password (minimal 6 karakter)
- Konfirmasi Password (harus sama)
Tombol Registrasi → Validasi semua field
API call ke /registrasi dengan data user
Jika berhasil → Tampilkan dialog sukses → Redirect ke login
Jika gagal → Tampilkan dialog error.

## 3. CREATE (Tambah Produk)
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (2)" src="https://github.com/user-attachments/assets/1ead2aba-0931-4e57-a6de-661f0137e910" />
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (11)" src="https://github.com/user-attachments/assets/24dd9e10-9fdf-409c-9732-29f0a9831b24" />
Dari halaman produk → Klik tombol "+"
Form tambah produk muncul
Isi data:
- Kode Produk (wajib)
- Nama Produk (wajib)
- Harga (wajib, angka)
Tombol Simpan → Validasi → API POST ke /produk
Berhasil → Kembali ke list produk
Gagal → Tampilkan error dialog.

## 4. READ (Lihat Produk)
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (12)" src="https://github.com/user-attachments/assets/1f5f9e63-4be0-4e60-a7cd-6ba527fe15bd" />
Halaman produk load → Auto fetch data dari API /produk
Tampilkan loading indicator saat fetching
Data diterima → Render ListView dengan Card
Klik item produk → Navigasi ke detail produk
Detail produk menampilkan:
- Kode, Nama, Harga
- Tombol Edit & Delete

## 5. UPDATE (Edit Produk)
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (13)" src="https://github.com/user-attachments/assets/a573b9a3-5200-4eaf-b2ee-b312dd89cc38" />
Dari detail produk → Klik tombol "EDIT"
Form terbuka dengan data terisi (pre-filled)
Edit data yang diperlukan
Tombol Update → API PUT ke /produk/{id}
Berhasil → Kembali ke list dengan data terupdate
Gagal → Tampilkan error

## 6. DELETE (Hapus Produk)
<img width="200" height="400" alt="localhost_64777_(Samsung Galaxy S8+) (14)" src="https://github.com/user-attachments/assets/8a99fecd-2ce3-4d71-b573-cb358c120b06" />
Dari detail produk → Klik tombol "DELETE"
Dialog konfirmasi muncul ("Yakin ingin menghapus?")
Jika Ya → API DELETE ke /produk/{id}
Berhasil → Kembali ke list (produk hilang)
Gagal → Tampilkan error dialog

## SISTEM KEAMANAN
### Autentikasi:
- Token-based (Bearer token)
- Setiap API request membawa token di header
- Token disimpan di SharedPreferences
- Auto-login: Cek token saat app dibuka
### Validasi:
- Client-side validation di form
- Server-side validation via API response
- Error handling dengan custom exceptions

## ALUR DATA
User Input → Form Validation → API Call → Response Handling → UI Update
