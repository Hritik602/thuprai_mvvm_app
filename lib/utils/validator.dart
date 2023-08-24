class Validator {
  static String? validateName(String name) {
    if (name.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Password is required";
    } else if (password.length < 8) {
      return "Password length must be grater than 8 character";
    }
    return null;
  }
}
