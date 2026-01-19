class User {
  String id;

  User({required this.id});

  static fromMapList(dynamic items) {
    List<User> listUser = List.empty(growable: true);
    for (var map in items) {
      var user = User(id: map['id']);
      listUser.add(user);
    }
    return listUser;
  }

  User.fromMap(Map map) : this(id: map['id']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
