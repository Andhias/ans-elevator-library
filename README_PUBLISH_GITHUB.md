# Publish ANS Elevator Library ke GitHub Pages

Package siap publish:
`C:/Users/Andhias/Documents/elevator-cloud/github-pages-full`

Isi:
- 140 dokumen online
- total sekitar 610 MB
- tidak butuh Cloudflare R2
- tidak butuh kartu kredit
- output catalog: `catalog.json`
- web UI: `index.html`

## Cara publish dari CMD Windows

```bat
cd /d C:\Users\Andhias\Documents\elevator-cloud\github-pages-full
publish_github_pages.cmd
```

Script akan:
1. cek login GitHub
2. jika belum login, menjalankan `gh auth login`
3. membuat repo public `ans-elevator-library`
4. push semua file
5. mengaktifkan GitHub Pages dari branch `main` root
6. menampilkan URL catalog

## URL hasil

Setelah sukses, catalog URL formatnya:

```text
https://<github-username>.github.io/ans-elevator-library/catalog.json
```

Contoh jika username GitHub bro `andhias`:

```text
https://andhias.github.io/ans-elevator-library/catalog.json
```

Masukkan URL itu di APK:
Settings -> Catalog URL -> Save & Sync

## Custom domain opsional

Kalau mau tetap pakai:

```text
https://library.ans-mag.net/catalog.json
```

Di GitHub repo:
Settings -> Pages -> Custom domain -> `library.ans-mag.net`

Di Cloudflare DNS:
Tambah CNAME:

```text
Name: library
Target: <github-username>.github.io
Proxy: DNS only / grey cloud
```

Lalu tunggu DNS aktif.

## Catatan
GitHub Pages cocok untuk awal dan gratis. Jika traffic tinggi atau file sering di-download banyak orang, nanti bisa pindah ke object storage/CDN.
