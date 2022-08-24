//  {
//       "street": "Kulas Light",
//       "suite": "Apt. 556",
//       "city": "Gwenborough",
//       "zipcode": "92998-3874",
//       "geo": {
//         "lat": "-37.3159",
//         "lng": "81.1496"
//       }
//     },

class Address {
  final String street, city, suite, zipcode;

  final String latitude, longitude;
  final Geo geo;

  Address({
    required this.street,
    required this.city,
    required this.suite,
    required this.zipcode,
    required this.latitude,
    required this.longitude,
    required this.geo,
  });

  static Address addressFromJson(Map json) {
    return Address(
      street: json['street'],
      city: json['city'],
      suite: json['suite'],
      zipcode: json['zipcode'],
      latitude: json['geo']['lat'],
      longitude: json['geo']['long'],
      geo: Geo.convertGeoFromJson(json['geo']),
    );
  }
}

//  {
//         "lat": "-37.3159",
//         "lng": "81.1496"
//       }
class Geo {
  final String lat, long;

  Geo({required this.lat, required this.long});

  factory Geo.convertGeoFromJson(Map json) {
    return Geo(lat: json['lat'], long: json['long']);
  }
}

// factory