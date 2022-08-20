part of 'consts.dart';

String? emailValidator(String? value) {
  RegExp regex = new RegExp(EMAIL_PATTERN);
  if (!regex.hasMatch(value!)) {
    return '';
  } else {
    return null;
  }
}

String? pwdValidator(String? value) {
  int lengthOfPassword = value?.length ?? 0;
  if (lengthOfPassword < MINIMUM_PASSWORD_LENGTH) {
    return '';
  } else {
    return null;
  }
}

String? nameValidator(String? value) {
  int lengthOfName = value?.length ?? 0;
  if (lengthOfName < MINIMUM_NAME_LENGTH) {
    return '';
  } else {
    return null;
  }
}
