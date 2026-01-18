class User {
  int? id;
  String name;
  // final String userName;
  String email;
  // final String address;
  // final String phone;
  // final String website;
  // final String company;

  User({
    required this.id,
    required this.name,
    // required this.userName,
    required this.email,
    // required this.address,
    // required this.phone,
    // required this.website,
    // required this.company,
  });

  static fromMapList(dynamic items) {
    List<User> listUser = List.empty(growable: true);
    for (var map in items) {
      var user = User(id: map['id'], name: map['name'], email: map['email']);
      // user.name = map['name'],
      // userName: map['userName'],
      // user.email =  map['email'],
      // address: map['address'],
      // phone: map['phone'],
      // website: map['website'],
      // company: map['company'],
      listUser.add(user);
    }
    return listUser;
  }

  User.fromMap(Map map)
    : this(
        id: map['id'],
        name: map['name'],
        // userName: map['userName'],
        email: map['email'],
        // address: map['address'],
        // phone: map['phone'],
        // website: map['website'],
        // company: map['company'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
