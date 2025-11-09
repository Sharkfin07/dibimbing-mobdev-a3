/* 
  * Assignment Day 4: Analisis Kinerja Karyawan Dibimbing
  * Dikembangkan oleh Mohammad Zidane Kurnianto
*/

const List<Map<String, dynamic>> dataKaryawan = [
  {
    'nama': 'Alice',
    'departemen': 'Pengembangan',
    'skorKinerja': 4.5,
    'jumlahProyek': 8,
    'tahunGabung': '2022',
    'statusPelatihan': true,
    'gajiPokok': 7000000,
  },
  {
    'nama': 'Bob',
    'departemen': 'Pemasaran',
    'skorKinerja': 3.8,
    'jumlahProyek': 5,
    'tahunGabung': '2021',
    'statusPelatihan': false,
    'gajiPokok': 6500000,
  },
  {
    'nama': 'Charlie',
    'departemen': 'Pengembangan',
    'skorKinerja': 4.9,
    'jumlahProyek': 10,
    'tahunGabung': '2023',
    'statusPelatihan': true,
    'gajiPokok': 8000000,
  },
  {
    'nama': 'Diana',
    'departemen': 'HR',
    'skorKinerja': 4.2,
    'jumlahProyek': 3,
    'tahunGabung': '2022',
    'statusPelatihan': true,
    'gajiPokok': 6000000,
  },
  {
    'nama': 'Eve',
    'departemen': 'Pemasaran',
    'skorKinerja': 3.5,
    'jumlahProyek': 6,
    'tahunGabung': '2023',
    'statusPelatihan': false,
    'gajiPokok': 6200000,
  },
  {
    'nama': 'Frank',
    'departemen': 'Pengembangan',
    'skorKinerja': 4.7,
    'jumlahProyek': 9,
    'tahunGabung': '2021',
    'statusPelatihan': true,
    'gajiPokok': 7500000,
  },
  {
    'nama': 'Grace',
    'departemen': 'HR',
    'skorKinerja': 3.0,
    'jumlahProyek': 2,
    'tahunGabung': '2024',
    'statusPelatihan': false,
    'gajiPokok': 5800000,
  },
  {
    'nama': 'Heidi',
    'departemen': 'Pengembangan',
    'skorKinerja': 4.1,
    'jumlahProyek': 7,
    'tahunGabung': '2022',
    'statusPelatihan': true,
    'gajiPokok': 7200000,
  },
];

/*
  ! Hanya ada 6 metode looping yang disebutkan dalam panduan (for, for-in, forEach, while, do-while, map)
  ! Maka dari itu, ada 2 metode yang akan digunakan 2 kali dalam program di bawah
*/

void main() {
  print('--- Analisis Kinerja Karyawan "Dibimbing" ---\n');

  // * Soal 1: Do-while Loop
  double _totalSalary = 0;
  int _i = 0;

  do {
    _totalSalary += dataKaryawan[_i]['gajiPokok'];
    _i++;
  } while (_i < dataKaryawan.length);

  print(
    "1. Total Gaji Pokok Keseluruhan Karyawan: Rp${_totalSalary.toStringAsFixed(2)}\n",
  );

  // * Soal 2: .map() Method
  List<String?> _hardWorking = dataKaryawan
      .map((Map<String, dynamic> k) {
        if (k['skorKinerja'] > 4.0) return k['nama'] as String;
      })
      .whereType<String>() // Menghapus null dari List
      .toList();

  print("2. Karyawan Berkinerja di atas 4.0: ${_hardWorking.join(", ")}\n");

  // * Soal 3: While Loop
  _i = 0;
  List<String> _notTrained =
      []; // Berisi list nama karyawan yang belum dilatih, list ini akan digunakan kembali di soal ke-8

  while (_i < dataKaryawan.length) {
    if (!dataKaryawan[_i]['statusPelatihan'])
      _notTrained.add(dataKaryawan[_i]['nama']);
    _i++;
  }

  print("3. Jumlah Karyawan Belum Pelatihan: ${_notTrained.length}\n");

  // * Soal 4: For-in Loop
  bool _perfectPerformance = false;
  for (Map<String, dynamic> k in dataKaryawan) {
    if (k['skorKinerja'] == 5.0) {
      _perfectPerformance = true;
      break;
    }
  }

  print(
    "4. Apakah Ada Karyawan dengan Skor Kinerja 5.0: ${_perfectPerformance ? "Ada" : "Tidak"}\n",
  );

  // * Soal 5: Traditional For Loop
  print("5. Laporan Ringkas Karyawan:");

  for (int i = 0; i < dataKaryawan.length; i++) {
    final Map<String, dynamic> _summary = {
      'nama': dataKaryawan[i]['nama'],
      'departemen': dataKaryawan[i]['departemen'],
      'skorKinerja': dataKaryawan[i]['skorKinerja'],
    };

    print('   $_summary');
  }

  print('');

  // * Soal 6: .forEach() Loop
  int _totalProject = 0;
  dataKaryawan.forEach((Map<String, dynamic> k) {
    final int project = k['jumlahProyek'];
    _totalProject += project;
  });
  double _projectMean = _totalProject / dataKaryawan.length;

  print("6. Rata-Rata Proyek Keseluruhan Karyawan: $_projectMean\n");

  // * Soal 7: For-in Loop
  print(
    "7. Karyawan Pengembangan yang Memiliki Jumlah Proyek di atas Rata-Rata: ",
  );

  for (Map<String, dynamic> k in dataKaryawan) {
    if ((k['departemen'] == 'Pengembangan') &&
        (k['jumlahProyek'] > _projectMean)) {
      print("   ${k['nama']} (${k['jumlahProyek']} proyek)");
    }
  }

  print('');

  // * Soal 8: While Loop (Dari nomor 3)
  // Untuk menjaga efisiensi, saya menggunakan list dari nomor 3 untuk menghindari pemrosesan 2 kali
  print(
    "8. Karyawan yang Belum Melakukan Pelatihan: ${_notTrained.join(", ")}",
  );
}
