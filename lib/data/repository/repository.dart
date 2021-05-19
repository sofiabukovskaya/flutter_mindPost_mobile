abstract class Repository {
  void signUp(String name, String surname, String nickname, String email,
      String birthday, String phone, String password);

  Future signIn(String email, String password);

   logout();
}
