abstract class Validator {
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это обязательное поле.';
    }
    return null;
  }

  static String? surname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это обязательное поле.';
    }
    return null;
  }

  static String? birthday(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это обязательное поле.';
    } else if (_regex['birthday']?.hasMatch(value) == null) {
      return 'Введите формат даты типа XX-XX-XXXX';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это обязательное поле.';
    }
    return null;
  }

  static String? profession(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это обязательное поле.';
    }
    return null;
  }
}

final Map<String, RegExp> _regex = {
  'birthday': RegExp(r"'\d{2}-\d{2}-\d{4}'"),
};
