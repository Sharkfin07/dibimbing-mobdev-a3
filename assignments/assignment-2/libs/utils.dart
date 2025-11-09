import 'user.dart';

// * User funcs
// Mencari user berdasarkan email
User? findByEmail(String targetEmail, List<User> users) {
  for (User user in users) {
    if (user.email == targetEmail) return user;
  }
  return null;
}

List<User> sortByEmail(List<User> users) {
  List<User> sorted = [...users];
  sorted.sort((a, b) {
    final aEmail = a.email ?? '';
    final bEmail = b.email ?? '';
    return aEmail.compareTo(bEmail);
  });
  return sorted;
}

// Mencari admin dengan permission tertentu
List<Admin> findByPermission(String targetPermission, List<Admin> admins) {
  List<Admin> targetAdmins = [];
  for (Admin admin in admins) {
    if (admin.permissions != null &&
        admin.permissions!.contains(targetPermission))
      targetAdmins.add(admin);
  }

  return targetAdmins;
}

// Mencari customer di wilayah tertentu
List<Customer> findByAddress(String targetAddress, List<Customer> customers) {
  List<Customer> targetCustomers = [];
  for (Customer customer in customers) {
    if (customer.address == targetAddress) targetCustomers.add(customer);
  }

  return targetCustomers;
}

// * Misc. funcs
void header(String content, {int width = 20}) {
  print("\n${'=' * width} $content ${'=' * width}\n");
}
