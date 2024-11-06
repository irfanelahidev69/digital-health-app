mixin Validators {
  bool validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$").hasMatch(email);
  }

  bool validateName(String name) {
    if (name.length < 3 || name.isEmpty) {
      return false;
    }
    return true;
  }

  bool validatePassword(String password) {
    if (password.length < 6 || password.isEmpty) {
      return false;
    }
    return true;
  }

  bool validateConfirmPassword(String password, String confirmPassword) {
    return password == confirmPassword;
  }

}
