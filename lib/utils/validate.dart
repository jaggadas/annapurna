String? validateNotEmptyString(value) {
  if (value == null || value.isEmpty || value == "") {
    return 'Enter some text';
  }
  return null;
}

String? validateEmail(value) {
  if (value == null || value.isEmpty) {
    return 'Enter some text';
  }
  bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
  if (!emailValid) {
    return 'Enter valid email';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter some text';
  }
  if (value.length < 6) {
    return "Length should at least 6";
  }
  if (!RegExp(r'.*[0-9]+.*$').hasMatch(value)) {
    return 'Must contain a number - [0-9]';
  }
  if (!RegExp(r'.*[a-zA-Z]+.*$').hasMatch(value)) {
    return 'Must contain an alphabet - [A-Z] or [a-z]';
  }
  return null;
}