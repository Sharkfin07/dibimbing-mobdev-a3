// * Link to GitHub repo: https://github.com/Sharkfin07/dibimbing-mobdev-a2
import './libs/user.dart';
import './libs/utils.dart';
import 'dart:convert';
import 'dart:io';

// * Return sebuah list dengan len 2 yang berisi [data customer, data admin]
Future<List> fetchUserData(String jsonDir) async {
  // * Fetch data (simulasi fetch API)
  final jsonData = await File('./public/user_data.json').readAsString();
  final userData = jsonDecode(jsonData);

  // * Inisialisasi data
  // Inisialisasi data customer
  List<Customer> userCustomerData = [];
  for (Map<String, dynamic> c in userData['userCustomerData'])
    userCustomerData.add(Customer.toJson(c));

  // Inisialisasi data admin
  List<Admin> userAdminData = [];
  for (Map<String, dynamic> a in userData['userAdminData'])
    userAdminData.add(Admin.toJson(a));

  return [userCustomerData, userAdminData];
}

void main() async {
  final [customers, admins] = await fetchUserData('./public/user_data.json');

  // Data gabungan users
  final List<User> users = [...customers, ...admins];

  // ! Test 1: Search users by email
  header("Function 1: Mencari User dengan E-mail Tertentu");
  final targetUser = findByEmail("admin1@example.com", users);
  if (targetUser != null) print(targetUser.password);

  // ! Test 2: Search admins by permission
  header("Function 2: Mencari Admin dengan Permissions Tertentu");
  final targetAdmin = findByPermission("add", admins);
  targetAdmin.forEach(
    (it) => print(it.email),
  ); // Menampilkan email target admin

  // ! Test 3: Search customers by addres
  header("Function 3: Mencari Customer dengan Address Tertentu");
  final targetCustomer = findByAddress("Jakarta", customers);
  targetCustomer.forEach(
    (it) => print(it.email),
  ); // Menampilkan email target user

  // ! Test 4: Sorting users by email
  header("Function 4: Sorting User berdasarkan E-mail");
  final sortedUsers = sortByEmail(users);
  sortedUsers.forEach(
    (it) => it.showData(),
  ); // Menampilkan data user yang sudah di sort
}
