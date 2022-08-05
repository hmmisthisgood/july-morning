abstract class User {
  login(String email);
  logout();
}

class Admin extends User {
  @override
  logout() {}

  @override
  login(String email) {}
}

class Customer extends User {
  @override
  @override
  logout() {}

  @override
  login(String email) {}
}

void main(List<String> args) {
  var admin = Admin();

  bool isAdminUser = admin is User;
  var client = Customer();
  bool isCustomerUser = client is User;

  print(isCustomerUser);
  print(isAdminUser);
}
