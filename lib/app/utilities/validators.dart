import 'appUtil.dart';

class QuickGenericValidator<T> {
  final bool isRequired;
  final String? Function(T value)? extraValidation;

  const QuickGenericValidator({
    this.isRequired = true,
    this.extraValidation,
  });

  String? call(T value) => validate(value);

  String? validate(T value) {
    if (isRequired == true) {
      if (value == null) {
        return 'This field is required!';
      }
    }
    if (extraValidation != null) {
      final res = extraValidation!(value);
      if (res != null) {
        return res;
      }
    }
    return null;
  }
}

class QuickTextValidator {
  final bool isRequired;
  final bool? isEmail;
  final bool? isPhone;
  final bool? isNationalId;
  final int? hasMinLength;
  final int? hasMaxLength;
  final String? Function(String?)? extraValidation;

  const QuickTextValidator({
    this.isRequired = true,
    this.isNationalId,
    this.isEmail,
    this.isPhone,
    this.hasMinLength,
    this.extraValidation,
    this.hasMaxLength,
  });

  String? call(String? value) => validate(value!);

  String? validate(String value) {
    if (isRequired == true) {
      if (value == null || value.isEmpty) {
        return 'This field is required!';
      }
    }
    if (value != null && value.isNotEmpty) {
      if (isNationalId == true) {
        if (value.length != 14 || int.tryParse(value) == null) {
          return 'Please Enter valid national id';
        }
      }
      if (isEmail == true) {
        if (!AppUtil.emailValidatorRegExp.hasMatch(value)) {
          return 'Please Enter a valid Email';
        }
      }
      if (isPhone == true) {
        if (!AppUtil.phoneValidatorRegExp.hasMatch(value)) {
          return 'Please Enter valid phone number';
        }
      }
      if (hasMinLength != null) {
        if (value.length < hasMinLength!) {
          return 'Please insert $hasMinLength digit as least';
        }
      }
      if (extraValidation != null) {
        final res = extraValidation!(value);
        if (res != null) {
          return res;
        }
      }
    }
    return null;
  }
}
