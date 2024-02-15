class User {
   String? name;
   String? username;
   String? password;

  User(this.name, this.username, this.password);

  User.fromMap(dynamic obj) {
    name = obj['name'];
    username = obj['username'];
    password = obj['password'];
  }
}