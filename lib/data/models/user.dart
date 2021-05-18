class UserModel {
  final String userId;
final String name;
final String surname;
final String nickname;
final String email;
final DateTime birthday;
final String phoneNumber;
final String password;
final List<String> nodesId;

  UserModel(this.userId, this.name, this.surname, this.nickname, this.email, this.birthday, this.phoneNumber, this.password, this.nodesId);
}