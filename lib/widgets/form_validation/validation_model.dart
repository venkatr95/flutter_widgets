import 'package:flutter/material.dart';
import 'package:flutter_widgets/widgets/form_validation/string_regex.dart';

class ValidationModel {
  String? value;
  String? error;
  ValidationModel(this.value, this.error);
}

class FormProvider extends ChangeNotifier {
  ValidationModel valEmail = ValidationModel(null, null);
  ValidationModel valPassword = ValidationModel(null, null);
  ValidationModel valPhone = ValidationModel(null, null);
  ValidationModel valName = ValidationModel(null, null);
  ValidationModel get email => valEmail;
  ValidationModel get password => valPassword;
  ValidationModel get phone => valPhone;
  ValidationModel get name => valName;

  void validateEmail(String? val) {
    if (val != null && val.isValidEmail) {
      valEmail = ValidationModel(val, null);
    } else {
      valEmail = ValidationModel(null, 'Please Enter a Valid Email');
    }
    notifyListeners();
  }

  void validatePassword(String? val) {
    if (val != null && val.isValidPassword) {
      valPassword = ValidationModel(val, null);
    } else {
      valPassword = ValidationModel(null,
          'Password must contain an uppercase, lowercase, numeric digit and special character');
    }
    notifyListeners();
  }

  void validatePhone(String? val) {
    if (val != null && val.isValidPhone) {
      valPhone = ValidationModel(val, null);
    } else {
      valPhone = ValidationModel(null, 'Phone Number must be up to 11 digits');
    }
    notifyListeners();
  }

  void validateName(String? val) {
    if (val != null && val.isValidName) {
      valName = ValidationModel(val, null);
    } else {
      valName = ValidationModel(null, 'Please enter a valid name');
    }
    notifyListeners();
  }

  bool get validate {
    return valEmail.value != null &&
        valPassword.value != null &&
        valPhone.value != null &&
        valName.value != null;
  }
}