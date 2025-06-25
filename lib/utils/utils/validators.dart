class Validators {
  // Empty validator
  static String? emptyValidator(
    String? value, {
    String fieldName = "This field",
  }) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  // Email validator
  static String? emailValidator(String? value) {
    final emptyCheck = emptyValidator(value, fieldName: "Email");
    if (emptyCheck != null) return emptyCheck;

    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegex.hasMatch(value!.trim())) {
      return "Please enter a valid email address";
    }
    return null;
  }

  // Password validator
  static String? passwordValidator(String? value) {
    final emptyCheck = emptyValidator(value, fieldName: "Password");
    if (emptyCheck != null) return emptyCheck;

    if (value!.length < 8) {
      return "Password must be at least 8 characters";
    }

    // final pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
    // final regExp = RegExp(pattern);
    // if (!regExp.hasMatch(value)) {
    //   return 'Password must contain letters and numbers';
    // }
    return null;
  }

  // Confirm Password validator
  static String? confirmPasswordValidator(
    String? value,
    String? originalPassword,
  ) {
    final emptyCheck = emptyValidator(value, fieldName: "Confirm Password");
    if (emptyCheck != null) return emptyCheck;

    if (value != originalPassword) {
      return "Passwords do not match";
    }
    return null;
  }

  // Phone number validator
  static String? phoneValidator(String? value) {
    final emptyCheck = emptyValidator(value, fieldName: "Phone number");
    if (emptyCheck != null) return emptyCheck;

    final phoneRegex = RegExp(r'^\+?\d{7,15}$');
    if (!phoneRegex.hasMatch(value!.trim())) {
      return "Please enter a valid phone number";
    }
    return null;
  }

  // Username validator
  static String? usernameValidator(String? value) {
    final emptyCheck = emptyValidator(value, fieldName: "Username");
    if (emptyCheck != null) return emptyCheck;

    if (value!.length < 3) {
      return "Username must be at least 3 characters";
    }
    return null;
  }
}
