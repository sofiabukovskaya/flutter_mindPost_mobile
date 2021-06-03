
class Validators {
   final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
   final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );
   final RegExp _phoneNumberRegExp = RegExp(
    r'^\+?([0-9]{2})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/',
  );

   bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

   bool isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

   bool isValidPhoneNumber(String phone) {
    return _phoneNumberRegExp.hasMatch(phone);
  }
}