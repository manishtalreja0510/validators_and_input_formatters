

/// This will be the validators that you can add in your text form field to have a proper form field validation.
class CustomValidators {

  /// Validates a text field as required.
  ///
  /// This function ensures that the field is not left empty
  ///

  /// ### Example:
  ///
  /// ```dart
  ///   (val) => ValidationFunction.requiredValidation(val),
  /// ```
  ///
  /// - [val] is the value of the text field.
  static requiredValidation(val, {String? msg}) {
    if (val == null || val.toString().trim().isEmpty) {
      return msg ?? "Required*";
    } else {
      return null;
    }
  }


  /// Validates a text field as mobile number.
  ///
  /// This function ensures that the field is not left empty, and the text field is the mobile number
  ///

  /// ### Example:
  ///
  /// ```dart
  ///   (val) => ValidationFunction.mobileNumberValidation(val),
  /// ```
  ///
  /// - [val] is the value of the text field.
  /// - [length] is the max length of the characters. By default it is set to 10.
  static mobileNumberValidation(val, {int length = 10}) {
    if (val.toString().trim().isEmpty) {
      return "Required*";
    } else if (val.toString().trim().length < length) {
      return "Enter $length digit mobile number";
    } else {
      return null;
    }
    // return null;
  }



  /// Validates a password.
  ///
  /// This function ensures that the field is valid password
  ///

  /// ### Example:
  ///
  /// ```dart
  ///   (val) => ValidationFunction.passwordValidation(val),
  /// ```
  ///
  /// - [val] is the value of the text field.
  /// /// - [length] is the min length of the characters. By default it is set to 6.
  static passwordValidation(String? val, {int? length=6}) {
    if (val.toString().trim().isEmpty) {
      return "Required*";
    } else if (val.toString().trim().length < (length??6)) {
      return "Enter at least $length character password";
    } else {
      return null;
    }
  }

  /// Validates a pin code
  ///
  /// This function ensures that the field is not left empty, and it should have atleast equal to min range(4 default)
  ///

  /// ### Example:
  ///
  /// ```dart
  ///   (val) => ValidationFunction.pinValidation(val),
  /// ```
  ///
  /// - [val] is the value of the text field.
  /// - [length] is the max length of the characters. By default it is set to 4.
  static pinValidation(String? val, {int length =4}) {
    if (val.toString().trim().isEmpty) {
      return "Required*";
    } else if (val.toString().trim().length < (length)) {
      return "It should be atleast $length digits";
    } else {
      return null;
    }
  }




  /// Validates that the confirm password matches the original password.
  ///
  /// This function is intended to be used for confirming password fields,
  /// ensuring that the value entered matches the original password.
  ///
  /// ### Example:
  ///
  /// ```dart
  /// (val) => CustomValidators.confirmPasswordValidation(
  ///   val,
  ///   passwordController.text,
  /// );
  /// ```
  ///
  /// - [val] is the value of the confirm password field.
  /// - [passwordController.text] is the original password value.
  static confirmPasswordValidation(
      String? confirmNewPassword, String password) {
    if (confirmNewPassword == null || confirmNewPassword.trim().isEmpty) {
      return "Required*";
    } else if (confirmNewPassword.trim().length < 6) {
      return "Enter at least 6 character password";
    } else if (confirmNewPassword.trim() != password.trim()) {
      return "Confirm password &  password not match";
    } else {
      return null;
    }
    // return null;
  }


  /// Validates a full name input to ensure it contains valid characters and format.
  ///
  /// This function checks if the provided name:
  /// - Is not empty
  /// - Matches a pattern for typical full names (including spaces, dots, apostrophes, and hyphens)
  ///
  /// ### Example:
  ///
  /// ```dart
  ///   (val) => ValidationFunction.nameValidation(val),
  /// ```
  ///
  /// - [val] is the value of the text field.

  static nameValidation(String val) {
    RegExp nameRegex =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    if (val.trim().isEmpty) {
      return "Required*";
    } else if (!nameRegex.hasMatch(val.trim())) {
      return "Enter correct name";
    } else {
      return null;
    }
  }


  /// Validates a email.
  ///
  /// This function checks if the string is the valid email or not:
  ///
  /// ### Example:
  ///
  /// ```dart
  ///   (val) => ValidationFunction.emailValidation(val),
  /// ```
  ///
  /// - [val] is the value of the text field.

  static emailValidation(val) {
    RegExp emailAddress = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (val.toString().trim().isEmpty) {
      return "Please enter your email id*";
    } else if (!emailAddress.hasMatch(val.toString().trim())) {
      return "Enter correct email address";
    } else {
      return null;
    }
  }



  /// Validates a number.
  ///
  /// This function ensures that the typed string is a valid number
  ///
  /// Also You can pass the maximumNumber and minimumNumber to make sure that the number lies between your specified range:
  ///
  /// ### Example:
  ///
  /// ```dart
  ///   (val) => ValidationFunction.requiredNumberValidation(val),
  /// ```
  ///
  /// - [val] is the value of the text field.
  /// - [maximumNumber] (Optional) is the max range of the text field.
  /// - [minimumNumber] (Optional) is the min range of the text field.
  static requiredNumberValidation(val, {double? maximumNumber, double? minimumNumber}) {
    RegExp numberValidation = RegExp(r'^-?\d+$');
    if (val.toString().trim().isEmpty) {
      return "Required Field*";
    } else if (!numberValidation.hasMatch(val.toString().trim())) {
      return "This number should be an integer";
    }

    if(maximumNumber!=null){
      try{
        double number = double.parse(val);
        if(number>maximumNumber){
          return "The number cannot be more than ${maximumNumber.toStringAsFixed(0)}";
        }
      }catch(e){
        return 'Invalid Number';
      }
    }
    if(minimumNumber!=null){
      try{
        // double number = double.parse(val);
        if(val<minimumNumber){
          return "The number cannot be less than ${minimumNumber.toStringAsFixed(0)}";
        }
      }catch(e){
        return 'Invalid Number';
      }
    }

      return null;
  }
}
