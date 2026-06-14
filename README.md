# 🎬 CineStream

CineStream adalah aplikasi katalog film berbasis web yang dikembangkan menggunakan konsep **Object-Oriented Programming (OOP)** dengan teknologi **Java JSP, Servlet, dan MySQL**. Aplikasi ini terinspirasi dari platform streaming modern seperti Disney+ dan Netflix, dengan fokus pada manajemen data film, sistem autentikasi pengguna, fitur favorit, rating komunitas, serta rekomendasi film berbasis kecerdasan buatan.

Proyek ini dikembangkan sebagai **Tugas Besar Mata Kuliah Pemrograman Berorientasi Objek (PBO)** Program Studi Informatika, Universitas Telkom Tahun 2026.

---

## ✨ Fitur Utama

### 👤 Authentication & User Management
- Registrasi akun pengguna
- Login dan logout
- Session management
- Profile pengguna
- Update informasi akun

### 🎥 Film Management
- Menampilkan katalog film
- Detail informasi film
- Genre film
- Poster film
- Deskripsi film

### ❤️ Favorite System
- Menambahkan film ke daftar favorit
- Menghapus film dari favorit
- Menampilkan koleksi film favorit pengguna

### ⭐ Rating & Review
- Memberikan rating pada film
- Menampilkan rata-rata rating komunitas
- Sistem evaluasi popularitas film

### 🤖 AI Recommendation
- Rekomendasi film berdasarkan preferensi pengguna
- Integrasi Claude AI API untuk menghasilkan rekomendasi yang lebih personal

### 📊 Dashboard
- Ringkasan aktivitas pengguna
- Statistik koleksi film favorit
- Navigasi cepat ke seluruh fitur aplikasi

---

## 🛠️ Teknologi yang Digunakan

| Teknologi | Kegunaan |
|------------|------------|
| Java | Bahasa Pemrograman Utama |
| JSP | Tampilan Web |
| Servlet | Backend Logic |
| MySQL | Database |
| JDBC | Koneksi Database |
| HTML5 | Struktur Halaman |
| CSS3 | Styling Antarmuka |
| Git & GitHub | Version Control |

---

## 🗄️ Struktur Database

Database CineStream terdiri dari beberapa tabel utama:

- `users`
- `movies`
- `favorites`
- `ratings`
- `recommendations`

Tabel-tabel tersebut digunakan untuk mengelola data pengguna, katalog film, favorit, rating, dan rekomendasi film.

---

## 🚀 Cara Menjalankan Project

### 1. Clone Repository

```bash
git clone https://github.com/username/repository.git
```

### 2. Import Project

- Buka Apache NetBeans
- Pilih Open Project
- Pilih folder project CineStream

### 3. Setup Database

- Buat database MySQL
- Import file SQL yang tersedia pada folder `database`
- Sesuaikan konfigurasi koneksi database

### 4. Jalankan Project

- Jalankan Apache Tomcat
- Klik Run Project pada NetBeans
- Akses aplikasi melalui browser

---

## 📂 Struktur Project

```
CineStream
│
├── Source Packages
├── web
├── database
├── nbproject
├── build.xml
└── README.md
```

---

## 👨‍💻 Tim Pengembang

Kelompok 08 IF-48-06

- Rionaldo Triandaka
- Viozky
- Anggota Kelompok Lainnya

---

## 🎯 Tujuan Proyek

Membangun aplikasi web katalog film yang menerapkan konsep-konsep Pemrograman Berorientasi Objek (OOP) seperti:

- Encapsulation
- Inheritance
- Polymorphism
- Abstraction

serta mengintegrasikan sistem database dan antarmuka web yang interaktif untuk memberikan pengalaman pengguna yang modern dan mudah digunakan.

---

## 📜 Lisensi

Proyek ini dibuat untuk kebutuhan akademik sebagai Tugas Besar Mata Kuliah Pemrograman Berorientasi Objek Universitas Telkom 2026.
