// Studi Kasus 1
void namaHari(int nomor) {
  switch (nomor) {
    case 1:
      print("Senin");
      break;
    case 2:
      print("Selasa");
      break;
    case 3:
      print("Rabu");
      break;
    case 4:
      print("Kamis");
      break;
    case 5:
      print("Jumat");
      break;
    case 6:
      print("Sabtu");
      break;
    case 7:
      print("Minggu");
      break;
    default:
      print("Nomor hari tidak valid");
  }
}

// Studi kasus 2
void cekAngka(int angka) {
  if (angka % 2 == 0) // Implementasi modulo
    print("Angka $angka adalah genap");
  else
    print("Angka $angka adalah ganjil");
}

void main() {
  // Test 1
  for (int i = 1; i <= 8; i++) namaHari(i);

  // Test 2
  cekAngka(4);
  cekAngka(29744982748932);
}
