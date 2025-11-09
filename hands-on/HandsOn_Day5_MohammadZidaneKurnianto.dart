void hr() => print("\n${"=" * 40}\n");

// * 1. Function Pertambahan
num add(num a, num b) =>
    a + b; // Pemilihan type num memungkinkan a atau b berupa bulat atau float

// * 2. Function Pengurangan
// Saya menggunakan parameter positional biasa karena operasi aritmetika lebih mementingkan posisi
num subtract(num a, num b) => a - b;

// * 3. Function Perkalian
num multiply(num a, num b) => a * b;

// * 4. Function Pembagian
num divide(num a, num b) => a / b;

// * BONUS: Print Formatter (Higher Order Function Implementation)
void printOperation(a, b, {required num Function(num a, num b) operation}) {
  Map<Function, String> symbol = {
    add: "+",
    subtract: "-",
    multiply: "×",
    divide: "÷",
  };

  print("$a ${symbol[operation]} $b = ${operation(a, b)}");
}

// * 5. Greater or equals to extension
extension NumExt on num {
  bool isEqualOrGreaterThan(num a) => this >= a;
} // Bisa diaplikasikan ke int dan double

void main() {
  // * 1 s.d. 4 Test
  printOperation(3, 7, operation: add);
  printOperation(9, 6, operation: subtract);
  printOperation(8, 7, operation: multiply);
  printOperation(6, 12, operation: divide);
  hr();

  // * 5 Test
  int n1 = 10;
  double n2 = 6.5;
  print(n1.isEqualOrGreaterThan(n2));
  print(n2.isEqualOrGreaterThan(n1));
}
