abstract class User {
  login();
  logout();
}

class Admin extends User {
  @override
  login() {}

  @override
  logout() {}
}

class Customer extends User {
  @override
  login() {}

  @override
  logout() {}
}

void main(List<String> args) {
  var admin = Admin();
  bool isAdminUser = admin is User;
  var client = Customer();
  bool isCustomerUser = client is User;

  print(isCustomerUser);
  print(isAdminUser);
}
