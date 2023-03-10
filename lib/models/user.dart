class User {

  User({
    required this.name,
    required this.lastname,
    required this.birthday,
    required this.addresses
  });

  String name;
  String lastname;
  DateTime birthday;
  List<Address> addresses;
}

class Address {

  Address({
    required this.address
  });
  String address;
  
}