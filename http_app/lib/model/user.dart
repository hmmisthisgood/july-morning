//  {
//     "id": 1,
//     "name": "Leanne Graham",
//     "username": "Bret",
//     "email": "Sincere@april.biz",
//     "address": {
//       "street": "Kulas Light",
//       "suite": "Apt. 556",
//       "city": "Gwenborough",
//       "zipcode": "92998-3874",
//       "geo": {
//         "lat": "-37.3159",
//         "lng": "81.1496"
//       }
//     },
//     "phone": "1-770-736-8031 x56442",
//     "website": "hildegard.org",
//     "company": {
//       "name": "Romaguera-Crona",
//       "catchPhrase": "Multi-layered client-server neural-net",
//       "bs": "harness real-time e-markets"
//     }
//   }

import 'package:http_app/model/address.dart';

class User {
  final int id;
  final String name, username, email, phone, website;
  Address address;
  final String companyName;
  final imageUrl;
  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.phone,
      required this.website,
      required this.address,
      required this.companyName,
      this.imageUrl = "https://someimage"});

  static User convertJsonToUser(Map json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address: Address.addressFromJson(json['address']),
      companyName: json['company']['name'],
    );
  }
}
