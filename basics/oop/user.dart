/// oop keywords:
/// class , extends
/// this , super ,with , override , abstract

class User {
  /// member variables

  String username, bio, userType;
  int age;

  /// private
  String _password;

  User({
    required this.age,
    required this.userType,
    required this.bio,
    required this.username,
    required String pass,
  }) : this._password = pass;

  // User(
  //     {required String username,
  //     required String userType,
  //     required int age,
  //     String? b}) {
  //   this.username = username;
  //   this.userType = userType;
  // } // this.bio = b;

  /// methods/functions

  /// getter and setter

  String getPassword() {
    return _password;
  }

  void setPassword(String newValue) {
    _password = newValue;
  }

  //  dart syntax for getter. retursns _password.
  String get password => _password;

  set password(String newValue) => _password = newValue;

  login() {
    print("$username has logged in");
    print(age);
    print(userType);
  }

  logout() {}
}

// iheritence
// abastraction
// polymorphism
// encapsulation

main() {
  User ram = User(
      age: 11,
      username: "iamRamey",
      userType: "admin",
      bio: "this",
      pass: "strongpassword"); // defualt constructor

  ram.username = "iamNotRamey";
  ram.login();
  // ram.logout();

  User jack = User(
      age: 11,
      username: "iamJack",
      userType: "admin",
      bio: "this",
      pass: "secretPassword");
  jack.login();

  // User mary = User();
}

/// create a class MobilePhone , add its properties,
/// create 3 phones, iphone13, note20, oneplusNord
