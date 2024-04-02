class Validator {
  const Validator._();

  static String? isEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }


  static String? isEmailValid(String? value) {
    String? res = isEmpty(value);
    if (res != null) return res;
    bool hasMatch = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);
    if (!hasMatch) {
      return "Invalid email";
    }
    return null;
  }

  static String? isPasswordValid(String? value) {
    String? res = isEmpty(value);
    if (res != null) return res;

    if (value!.length < 6) {
      return "Password must be at least 6 characters.";
    }
    return null;
  }
}
