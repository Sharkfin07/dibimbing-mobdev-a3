void hr() {
  print("\n${"=" * 40}\n");
}

void testDoWhileLoop(List<String> userInput) {
  print("Test Case: Do-While Loop (Simulasi Login)");

  const String password = 'flutter123';
  bool loggedIn = false;
  int i = 0;

  do {
    print('Percobaan ke-${i + 1}: "${userInput[i]}"');
    if (userInput[i] == password) {
      print("Login berhasil!");
      loggedIn = true;
      break;
    } else {
      print("Password salah!");
    }
    i++;
  } while (i < userInput.length);

  if (!loggedIn) print("Login gagal!");
}

void testWhileLoop(int target) {
  print("Test Case: While Loop (Menabung)");
  int saldo = 0;
  int minggu = 1;

  // Modif sesuka hati
  int tabungan = 100000;
  int tabunganPerMinggu = 5000;

  while (saldo < target) {
    int tabunganMinggu = tabungan + tabunganPerMinggu * minggu;
    saldo += tabunganMinggu;
    print("Minggu ke-$minggu: Nabung Rp$tabunganMinggu -> Total: Rp$saldo");
    if (saldo < target) minggu++; // Pokoknya work deh
  }

  print("Target Rp$target tercapat dalam $minggu minggu!");
}

void testForLoop(int start, int end) {
  print("Test Case: For Loop (Bilangan Genap)");

  if (start % 2 == 1) start += 1; // Memastikan start adalah bilangan genap

  int count = 0;

  for (int n = start; n <= end; n += 2) {
    print("$n adalah bilangan genap");
    count++;
  }

  print("Total bilangan genap antara $start-$end: $count");
}

void main() {
  // ! 1st Test case
  // Def Value = ['dart123', 'flutter12', 'flutter123']
  List<String> userInput = ['dart123', 'flutter12', 'flutter3'];
  testDoWhileLoop(userInput);

  hr();

  // ! 2nd Test case
  // Def Value = 1000000
  testWhileLoop(1000000);

  hr();

  // ! 3rd Test case
  // Def Value = 2, 30
  testForLoop(2, 30);
}
