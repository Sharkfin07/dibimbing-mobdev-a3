// * File yang berisi class yang berhubungan dengan user

abstract class User {
  String? _email, _password;

  bool _isValidEmail(String email) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  } // Validasi String email dengan regular expression

  bool login(String email, String password) {
    return _email == email && _password == password;
  } // Validasi apakah kombinasi email dan pass benar

  void showData() {
    print("E-mail: $_email");
  }

  // * Encapsulation Showcase
  String? get email => _email;
  String? get password => _password;
}

// * Inheritance Showcase
class Customer extends User {
  String name, address;

  Customer({
    required String email,
    required String password,
    required String this.name,
    required String this.address,
  }) {
    if (super._isValidEmail(email))
      _email = email;
    else
      throw FormatException("Incorrect email format ($email).");
    _password = password;
  }

  Customer.toJson(Map<String, dynamic> json)
    : this(
        email: json['email'],
        password: json['password'],
        name: json['name'],
        address: json['address'],
      );

  // * Polymorphism Showcase
  @override
  void showData() {
    super.showData();
    print("Nama: $name");
    print("Address: $address");
  }
}

// * Inheritance Showcase
class Admin extends User {
  List<dynamic>? _permissions;

  Admin({
    required String email,
    required String password,
    required List<dynamic> permissions,
  }) {
    if (super._isValidEmail(email))
      _email = email;
    else
      throw FormatException("Incorrect email format ($email).");
    _password = password;
    _permissions = permissions;
  }

  Admin.toJson(Map<String, dynamic> json)
    : this(
        email: json['email'],
        password: json['password'],
        permissions: json['permissions'],
      );

  // * Encapsulation Showcase
  List<dynamic>? get permissions => _permissions;
}
